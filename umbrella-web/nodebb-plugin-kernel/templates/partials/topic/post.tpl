<div class="clearfix">
	<div class="icon pull-left">
		<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
			<!-- IF posts.user.picture -->
			<img component="user/picture" data-uid="{posts.user.uid}" src="{posts.user.picture}" align="left" itemprop="image" />
			<!-- ELSE -->
			<div component="user/picture" data-uid="{posts.user.uid}" class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
			<!-- ENDIF posts.user.picture -->
			<i component="user/status" class="fa fa-circle status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>

		</a>
	</div>

	<small class="pull-left">
		<strong>
			<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.username}</a>
		</strong>

		<!-- IMPORT partials/topic/badge.tpl -->

		<!-- IF posts.user.banned -->
		<span class="label label-danger">[[user:banned]]</span>
		<!-- ENDIF posts.user.banned -->

		<div class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
			<a class="permalink" href="{config.relative_path}/topic/{slug}/{function.getBookmarkFromIndex}"><span class="timeago" title="{posts.timestampISO}"></span></a>

			<i class="fa fa-pencil-square pointer edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>

			<small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></small>

			<!-- IF posts.toPid -->
			<button component="post/parent" class="btn btn-xs btn-default hidden-xs" data-topid="{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></button>
			<!-- ENDIF posts.toPid -->

			<span>
				<!-- IF posts.user.custom_profile_info.length -->
				&#124;
				<!-- BEGIN custom_profile_info -->
				{posts.user.custom_profile_info.content}
				<!-- END custom_profile_info -->
				<!-- ENDIF posts.user.custom_profile_info.length -->
			</span>
		</div>
		<span class="bookmarked"><i class="fa fa-bookmark-o"></i></span>

    <!-- IF posts.waiting -->
    <span class="label label-info"><i class="fa fa-clock-o"></i> 等待运算</span>
    <!-- ENDIF posts.waiting -->
    <!-- IF posts.evaluate -->
    <span class="label label-primary"><i class="fa fa-play"></i> 正在计算</span>
    <!-- ENDIF posts.evaluate -->
    <!-- IF posts.finished -->
    <span class="label label-success"><i class="fa fa-check"></i> 计算成功</span>
    <a class="btn btn-default btn-xs" href="/kernel?p={posts.pid}" role="button"><i class="fa fa-play" aria-hidden="true"></i> 加载到执行器</a>
    <!-- ENDIF posts.finished -->
    <!-- IF posts.error -->
    <span class="label label-danger"><i class="fa fa-remove"></i> 语法错误</span>
    <a class="btn btn-default btn-xs" href="/kernel?p={posts.pid}" role="button"><i class="fa fa-play" aria-hidden="true"></i> 加载到执行器</a>
    <!-- ENDIF posts.error -->
    <!-- IF posts.aborted -->
    <span class="label label-warning"><i class="fa fa-exclamation"></i> 计算超时</span>
    <a class="btn btn-default btn-xs" href="/kernel?p={posts.pid}" role="button"><i class="fa fa-play" aria-hidden="true"></i> 加载到执行器</a>
    <!-- ENDIF posts.aborted -->
    
	</small>
</div>

<br />

<div class="content" component="post/content" itemprop="text">
	{posts.content}
</div>

<div class="clearfix">
	<!-- IF posts.user.signature -->
	<div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
	<!-- ENDIF posts.user.signature -->

	<small class="pull-right">
		<span class="post-tools">
			<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
			<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
		</span>

		<!-- IF !reputation:disabled -->
		<span class="votes">
			<a component="post/upvote" href="#" class="<!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
				<i class="fa fa-chevron-up"></i>
			</a>

			<span component="post/vote-count" data-votes="{posts.votes}">{posts.votes}</span>

			<!-- IF !downvote:disabled -->
			<a component="post/downvote" href="#" class="<!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
				<i class="fa fa-chevron-down"></i>
			</a>
			<!-- ENDIF !downvote:disabled -->
		</span>
		<!-- ENDIF !reputation:disabled -->

		<!-- IMPORT partials/topic/post-menu.tpl -->
	</small>
</div>

<hr />