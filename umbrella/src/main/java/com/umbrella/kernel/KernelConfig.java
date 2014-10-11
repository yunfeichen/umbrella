package com.umbrella.kernel;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class KernelConfig extends GenericObjectPoolConfig{
	private String url;
	private String dumpDir;
	private Libdir libdir;
	private int pageWidth;
	private int timeConstrained;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDumpDir() {
		return dumpDir;
	}

	public void setDumpDir(String dumpDir) {
		this.dumpDir = dumpDir;
	}

	public Libdir getLibdir() {
		return libdir;
	}

	public void setLibdir(Libdir libdir) {
		this.libdir = libdir;
	}

	public int getPageWidth() {
		return pageWidth;
	}

	public void setPageWidth(int pageWidth) {
		this.pageWidth = pageWidth;
	}

	public int getTimeConstrained() {
		return timeConstrained;
	}

	public void setTimeConstrained(int timeConstrained) {
		this.timeConstrained = timeConstrained;
	}

	class Libdir {
		private String name;
		private String dir;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDir() {
			return dir;
		}
		public void setDir(String dir) {
			this.dir = dir;
		}
	}
}
