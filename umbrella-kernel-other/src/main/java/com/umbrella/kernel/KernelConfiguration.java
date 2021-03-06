package com.umbrella.kernel;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.commons.pool2.ObjectPool;
import org.apache.commons.pool2.PooledObjectFactory;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.common.util.concurrent.ThreadFactoryBuilder;
import com.umbrella.kernel.link.KernelConfig;
import com.wolfram.jlink.KernelLink;
import com.wolfram.jlink.NativeLink;

@Configuration
public class KernelConfiguration {
	
	private final Logger LOG = LoggerFactory.getLogger(KernelConfiguration.class);
	
	@Autowired
	@Bean(destroyMethod = "close")
	public ObjectPool<KernelLink> provideKernelLinkPool(KernelConfig kernelConfig, PooledObjectFactory<KernelLink> kernelFactory) {
		System.setProperty(kernelConfig.getLibdir().getName(), kernelConfig.getLibdir().getDir());
		LOG.info("Loading J/Link Native Library");
		NativeLink.loadNativeLibrary();
		GenericObjectPool<KernelLink> pool = new GenericObjectPool<KernelLink>(kernelFactory, kernelConfig);
		return pool;
	}
	
	@Autowired
	@Bean(destroyMethod = "shutdown")
	public ExecutorService provideKernelTimeoutExecutorService(KernelConfig kernelConfig) {
		ExecutorService service = Executors.newFixedThreadPool(kernelConfig.getMaxTotal(), new ThreadFactoryBuilder().setNameFormat("kernel-timeout-thread").build());
		return service;
	}
	
}
