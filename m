Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FB9B570E
	for <lists+nouveau@lfdr.de>; Wed, 30 Oct 2024 00:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C59910E3C8;
	Tue, 29 Oct 2024 23:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G76qqw3V";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976E810E1A6
 for <nouveau@lists.freedesktop.org>; Tue, 29 Oct 2024 23:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8C7A3A435AA;
 Tue, 29 Oct 2024 23:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9231C4CECD;
 Tue, 29 Oct 2024 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730245212;
 bh=lm+r5XIv8nxVhivzXgN2PMVG51F6eoKfnrYZatLou9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G76qqw3VfHgIsaG/47WlYJiyFCGZDYZl16YaMQgMJ9YqqbEL+j0R7CRRCKlA3HR+j
 rko5MltwO5VBj7eC3+77AUICqSVO1a/yWNuk4zNMO3IRPtwrWEmM+my2k4dWf3IdZ8
 5eev4ds9jqnSnnsFRTqPaZo64ScwYg9oc1ae1h5cOBTUXpXSpk6k3HOl8b5UAuozjb
 790rJUZU86XqeibJ7ngauBR5nXDpAC00lfdgyvcDNlNVi1QsFJb1emIr0dAufebq87
 VWDTPzk5nkM9gkmDjERxFAVDj0BcoXxIHBDmW7M2fOz6/Y9junBHmOdyOQCB95ohYt
 8nFa+CSvuTKKA==
Date: Wed, 30 Oct 2024 00:40:08 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 2/2] [v8] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Message-ID: <ZyFyWCj6dfPWdBJy@pollux>
References: <20240910215616.1516679-1-ttabi@nvidia.com>
 <20240910215616.1516679-2-ttabi@nvidia.com>
 <Zv8ROwm6ynsKYouo@pollux>
 <2ff5ae312ca85e26fb3f3aaa85fbf3739d9d14e7.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ff5ae312ca85e26fb3f3aaa85fbf3739d9d14e7.camel@nvidia.com>
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 29, 2024 at 07:50:06PM +0000, Timur Tabi wrote:
> On Thu, 2024-10-03 at 23:48 +0200, Danilo Krummrich wrote:
> > > +#ifdef CONFIG_DEBUG_FS
> > > +	/*
> > > +	 * Logging buffers in debugfs. The wrapper objects need to remain
> > > +	 * in memory until the dentry is deleted.
> > > +	 */
> > > +	struct dentry *dir;		/* Parent dentry */
> > > +	struct dentry *dir_init;
> > > +	struct dentry *dir_rm;
> > > +	struct dentry *dir_intr;
> > > +	struct dentry *dir_pmu;
> > 
> > I think `dir` is confusing, maybe just `dent_*`? Or maybe just wrap all those in
> > a `struct { ... } debugfs;` and just name them `init`, `rm`, etc.?
> 
> Ok, but I'm pretty sure this is like the fifth time I've moved these fields
> around because you keep telling me to put them somewhere else.

You added those fields in *this* version, so I don't see how that makes any
sense.

If you don't want to rename them -- fine too. It was a suggestion, and since
you'll need a v9 anyways it doesn't seem like too much to ask for.

> 
> > > +/*
> > > + * The debugfs root for all devices.  Normally we'd use /sys/kernel/debug/dri.,
> > > + * but that path may not exist when we need it.  So create a new root
> > > + * /sys/kernel/debug/nouveau/.
> > > + *
> > > + * We take a reference every time a dentry under the root is created.  When
> > > + * the last reference is released, the root is deleted.
> > > + */
> > > +static struct {
> > > +	struct mutex mutex; /* Protects dentry */
> > > +	struct dentry *dentry;
> > > +	struct kref kref;
> > > +} root = {
> > > +	.mutex = __MUTEX_INITIALIZER(root.mutex),
> > > +	.kref = KREF_INIT(0),
> > > +	.dentry = NULL,
> > > +};
> > > +
> > > +static void release_root_dentry(struct kref *ref)
> > > +{
> > > +	mutex_lock(&root.mutex);
> > > +	debugfs_remove(root.dentry);
> > > +	root.dentry = NULL;
> > > +	mutex_unlock(&root.mutex);
> > > +}
> > 
> > I think all this should go into module_init() and module_exit(), then you don't
> > need the mutex and all the reference counts.
> 
> Sorry, I don't see how I can just move "all this" to module_init and exit. 
> The point is to keep the parent dentry around until the last GPU has shut
> down in r535_debugfs_shutdown().  
> 
> Please tell me what you think module_init() and module_exit() will look
> like.

You can create the root debugfs entry in module_init() and remove it in
module_exit() and make it available as a global. Then you don't need any mutex
and reference count.

Please let me know if anything is still unclear or if I miss anything.

> 
> > > +/**
> > > + * create_debufgs - create a blob debugfs entry
> > > + * @name: filename
> > > + * @parent: parent
> > > + * @blob: blob
> > > + *
> > > + * Creates a debugfs entry for a logging buffer with the name 'name'.
> > > + */
> > > +static struct dentry *create_debugfs(struct nvkm_gsp *gsp, const char *name,
> > > +				     struct debugfs_blob_wrapper *blob)
> > > +{
> > > +	struct dentry *dir;
> > 
> > I think `dir` is confusing, what about `dent` or `entry`?
> 
> Here's a count of the most popular names for this type:
> 
>      10 	struct dentry *ddir;
>      18 	struct dentry *d;
>      21 	struct dentry *debugfs_root;
>      31 	struct dentry *dbgfs_dir;
>      39 	struct dentry *debugfs_dir;
>      50 	struct dentry *dentry;
>      55 	struct dentry *debugfs;
>      55 	struct dentry *dir;
>      64 	struct dentry *root;
> 
> As you can see, 'dir' is the second most popular name.  So I think it's
> fine.

Being the second most popular name doesn't make it a good name. I wonder how
often people use "password" as their password...

> 
> Besides, couldn't you have make this suggestion during one of the previous 7
> versions of this patch?  I'm never going to get this patch finished if you
> keep asking for cosmetic changes.

Agreed, however, I think it got my attention, since you added all those

+	struct dentry *dir;		/* Parent dentry */
+	struct dentry *dir_init;
+	struct dentry *dir_rm;
+	struct dentry *dir_intr;
+	struct dentry *dir_pmu;

to struct nvkm_gsp in *this* version.

Feel free to keep it, but as mentioned above, you need a v9 anyways, so it also
shouldn't be a big deal to change those.

Please also note that none of the revisions you have been sending were motivated
by "cosmetic changes".

> 
> > > +	dir = debugfs_create_blob(name, 0444, gsp->dir, blob);
> > > +	if (IS_ERR(dir)) {
> > > +		nvkm_error(&gsp->subdev,
> > > +			   "failed to create %s debugfs entry\n", name);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	/*
> > > +	 * For some reason, debugfs_create_blob doesn't set the size of the
> > > +	 * dentry, so do that here.
> > > +	 */
> > > +	i_size_write(d_inode(dir), blob->size);
> > 
> > I think debugfs entries typically don't need this. Do we need it?
> 
> Yes.  I submitted a patch to debugfs earlier this year that would fix it for
> all debugfs blobs, but it was rejected because I was asked to fix all of
> debugfs itself, which I wasn't willing to do.
> 
> https://www.spinics.net/lists/linux-fsdevel/msg262843.html

I see...

Can you please add a very brief comment and this [1] link?

[1] https://lore.kernel.org/r/linux-fsdevel/20240207200619.3354549-1-ttabi@nvidia.com/

> 
> > > +	gsp->dir_init = create_debugfs(gsp, "loginit", &gsp->blob_init);
> > 
> > Here you use your helper, but for...
> > 
> > > +	if (!gsp->dir_init)
> > > +		goto error;
> > > +
> > > +	gsp->dir_intr = debugfs_create_blob("logintr", 0444, gsp->dir, &gsp->blob_intr);
> > > +	if (IS_ERR(gsp->dir_intr)) {
> > > +		nvkm_error(&gsp->subdev, "failed to create logintr debugfs entry\n");
> > > +		goto error;
> > > +	}
> > > +
> > > +	gsp->dir_rm = debugfs_create_blob("logrm", 0444, gsp->dir, &gsp->blob_rm);
> > > +	if (IS_ERR(gsp->dir_rm)) {
> > > +		nvkm_error(&gsp->subdev, "failed to create logrm debugfs entry\n");
> > > +		goto error;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Since the PMU buffer is copied from an RPC, it doesn't need to be
> > > +	 * a DMA buffer.
> > > +	 */
> > > +	gsp->blob_pmu.size = GSP_PAGE_SIZE;
> > > +	gsp->blob_pmu.data = kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
> > > +	if (!gsp->blob_pmu.data)
> > > +		goto error;
> > > +
> > > +	gsp->dir_pmu = debugfs_create_blob("logpmu", 0444, gsp->dir, &gsp->blob_pmu);
> > > +	if (IS_ERR(gsp->dir_pmu)) {
> > > +		nvkm_error(&gsp->subdev, "failed to create logpmu debugfs entry\n");
> > > +		kfree(gsp->blob_pmu.data);
> > > +		goto error;
> > > +	}
> > > +
> > > +	i_size_write(d_inode(gsp->dir_init), gsp->blob_init.size);
> > > +	i_size_write(d_inode(gsp->dir_intr), gsp->blob_intr.size);
> > > +	i_size_write(d_inode(gsp->dir_rm), gsp->blob_rm.size);
> > > +	i_size_write(d_inode(gsp->dir_pmu), gsp->blob_pmu.size);
> > 
> > ...all those, it seems you forgot to switch to your helper.
> 
> Oops.  I think I've been working on this patch too long.
> 
> I will post a v10 with struct { ... } debugfs and create_debugfs fixes.  But
> I will need your help with the module_init/exit change if you still want
> that.
> 
