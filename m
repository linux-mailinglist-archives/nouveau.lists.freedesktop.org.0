Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7C94345A
	for <lists+nouveau@lfdr.de>; Wed, 31 Jul 2024 18:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634CF10E699;
	Wed, 31 Jul 2024 16:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g5264oV4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EB710E699
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 16:48:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 20E8262505;
 Wed, 31 Jul 2024 16:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E714C116B1;
 Wed, 31 Jul 2024 16:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722444485;
 bh=L+OOamgI0/cdZYEfgC86nsvRPHvSd1XUKK069T5K0fY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g5264oV4ElLCFaf/Vfo/IRdn/SDHxBlxmbsY+OKUNRSJV5sSAOXs2BCZClup/f+Ws
 ztOx20bmZGqw5SsfoDvdshf0ndF+IN7hqRbVz7f19xlTdteUpe7WLnsmaJdfjGhNNc
 TnMlAR7okuV1Z4B3zthmV9PxVVMuwVmhDcpkUiEWXMxv40SWK+Msl1FNyznjcRUc3Q
 k60gHgLU/51SdlrYMhPpfncugEQSIg2ZNJo79izvGFC04EfO0lCRNk9CgEQlzfn6XN
 MBPVELHlK3+ZtQtAW+g/osluoye2TZbxWbSeHCPZxPAcSQOwZqfE3bSoUZMxYHaY7C
 pHrKSdPYQQYUw==
Date: Wed, 31 Jul 2024 18:48:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH 2/2] [v6] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Message-ID: <ZqpqwR2xwrcTesAQ@pollux>
References: <20240729230720.1305760-1-ttabi@nvidia.com>
 <20240729230720.1305760-2-ttabi@nvidia.com>
 <ZqgyJlXclrP19bNe@cassiopeiae>
 <80882b5b7726af1a7a861dccb437e9cb0c84370e.camel@nvidia.com>
 <ZqpQCI75gFZ315r6@pollux>
 <31f5d860a72e9c237d6b9cc0f4e51b6f49196042.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31f5d860a72e9c237d6b9cc0f4e51b6f49196042.camel@nvidia.com>
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

On Wed, Jul 31, 2024 at 04:22:10PM +0000, Timur Tabi wrote:
> On Wed, 2024-07-31 at 16:54 +0200, Danilo Krummrich wrote:
> > > 
> > > gsp_logs.shutdown(&gsp_logs) -- are you sure you want this?  This is some
> > > weird C++ wanna-be code, IMHO.  I don't think this is an improvement.  I'd
> > > rather keep it as-is.
> > 
> > That's why I wrote "maybe a bit too sneaky". :)
> > 
> > I think what I asked for originally in one of the last versions of this patch
> > is having both, struct nvif_log (exactly the way you have it) and a separate
> > struct nvif_logs:
> > 
> > 	struct nvif_logs {
> > 		struct list_head head;
> > 	};
> > 
> > Then you use this in NVIF_LOGS_DECLARE() and nvif_log_shutdown()
> > 
> > 	static inline void nvif_log_shutdown(struct nvif_logs *logs)
> > 
> > and in nouveau_drm_exit() you just pass &gsp_logs.
> > 
> > 	nvif_log_shutdown(&gsp_logs);
> > 
> > This way things are more type safe, i.e. nvif_log_shutdown() can't be called
> > with a random list_head and struct nvif_log::shutdown can't be called with the
> > "head instance" of struct struct nvif_log.
> 
> Ok, I think I got it this time.  I'll post a v7 soon.
> 
> > > However, I think it can happen.  drm_core_init() does not fail if
> > > debugfs_create_dir() fails:
> > > 
> > > 	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> > > 
> > > It doesn't even print a warning message.  It just keeps going.  So I think
> > > there should be some error checking somewhere.
> > 
> > For DRM probably not, since the ERR_PTR is honored by other debugfs functions
> > as described in [1].
> 
> From that comment:
> 
>  * Drivers should generally work fine even if debugfs fails to init anyway.
> 
> So technically you are correct, that Nouveau will still "work" if debugfs
> fails

That's not what I said, I said that the DRM APIs probably don't need to handle
the error.

> to init, but since this code is all about debugfs, and since I don't
> want to blindly allocate buffers and linked lists that won't actually do
> anything, I would prefer that the code bails early if the infrastructure is
> not there.

I do not disagree. Having the NULL check of debugfs_lookup() and bail out is
the right thing to do.

> 
> > > I tested this, and if drm_core_init() fails to create the dentry, then
> > > r535_gsp_retain_logging() will just keep going trying to create debugfs
> > > entries, because a root of NULL is actually valid, and the entries are
> > > created in /sys/kernel/debug/0000:65:00.0/ instead of
> > > /sys/kernel/debug/dri/0000:65:00.0/
> > 
> > This is because debugfs_lookup() doesn't return an ERR_PTR, but NULL. It'd
> > probably better go along with what is documented in [1] if debugfs_lookup()
> > would return ERR_PTR(-ENOENT) if no entry was found.
> > 
> > (This is where I was heading to in my previous reply.)
> 
> So I'm not sure what you're asking now.  I definitely think that the "if
> (!root)" check is necessary, because we don't want to accidentally create
> these debugfs entries in /sys/kernel/debug/0000:65:00.0/.

That's because I'm not asking for anything. :) I'm just saying that
debugfs_lookup() seems a bit inconsistent given the other documentation.

> 
> So that leaves the error checks for debugfs_create_dir() and
> debugfs_create_blob() in r535_gsp_copy_log().  Both of these functions could
> fail. 
> 
> If I ignore the error from debugfs_create_dir(), then the code will allocate
> buffers that are never used, and make false statements about the existence
> of them.
> 
> Same thing is true with debugfs_create_blob().
> 
> 	dir = debugfs_create_blob(name, 0444, parent, d);
> 	if (IS_ERR(dir)) {
> 		kfree(d->data);
> 		memset(d, 0, sizeof(*d));
> 		return PTR_ERR(dir);
> 	}
> 
> The one thing I could do is that is ignore errors from r535_gsp_copy_log(),
> and just blindly try to create all logs even if some of them fail.  I can't
> imagine a situation where create the loginit debugfs entry could fail, but
> then creating logintr succeeds.
> > 
> 
> > > In fact, I think I found a small bug in dput():
> > > 
> > > void dput(struct dentry *dentry)
> > > {
> > > 	if (!dentry)
> > > 		return;
> > > 
> > > This should probably be "if (IS_ERR_OR_NULL(dentry))".
> > 
> > Yes, I agree, good catch.
> 
> I will submit a separate patch for that.
> 
> 
