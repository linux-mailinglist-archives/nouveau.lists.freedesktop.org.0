Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DB94327B
	for <lists+nouveau@lfdr.de>; Wed, 31 Jul 2024 16:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7121B10E63C;
	Wed, 31 Jul 2024 14:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dYuMT6jt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9245210E63C
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 14:54:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1F586244C;
 Wed, 31 Jul 2024 14:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49894C116B1;
 Wed, 31 Jul 2024 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722437645;
 bh=7FlWzFKXl2kEFmcudFOjtNy8I5Xejj6oN0EEBANWZsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYuMT6jtGWi2E8C9F5PVE6Yy1DD/8nWl+f50D3j4Uuyrw2QNW3Wu9ApFHhlYpNCbI
 xAh2Y1ktZevnUJwWZgLzL0WUjK7tceo4yWRFjutb0jUl5CexofuHaC1RCfI1z/oQab
 Ep2bLPk6vWLubnPEjq1shfSinWEyNMPh8ktqrFrO92Pg5FVvzoiTmfcf0z+lPIh+Wb
 OYSULCK0sN0KOLWjS+eUsAp4CCUbKzIbqBquhmu27BA9tg6x6FjDqj7tviHx02KcJg
 O8DEasp15rKeNZn9rLgQmzUOtBEZmGYTzxZM7UvBgUI+5r4hnenTazo7YmCSEmuBIc
 VdLgq0fxPjK4A==
Date: Wed, 31 Jul 2024 16:54:00 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH 2/2] [v6] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Message-ID: <ZqpQCI75gFZ315r6@pollux>
References: <20240729230720.1305760-1-ttabi@nvidia.com>
 <20240729230720.1305760-2-ttabi@nvidia.com>
 <ZqgyJlXclrP19bNe@cassiopeiae>
 <80882b5b7726af1a7a861dccb437e9cb0c84370e.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80882b5b7726af1a7a861dccb437e9cb0c84370e.camel@nvidia.com>
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

On Tue, Jul 30, 2024 at 09:49:15PM +0000, Timur Tabi wrote:
> > "Driver exit" is a bit of an undefined term, the closest thing is probably
> > "driver detach" (from a device). In this case I think you actually mean
> > "module
> > exit" though.
> 
> Yes, I use driver and module interchangeably, but I guess that's not
> accurate.

Yes, it's not. They're entirely different things. Technically you don't even
need a module to register a driver. And within a module you can register N
drivers, including zero.

It's just that in the typical application, you register a driver in
module_init() and unregister it in module_exit().

> > > + * backing resources, such as logging buffers.
> > > + */
> > > +struct nvif_log {
> > > +	struct list_head entry;
> > > +	void (*shutdown)(struct nvif_log *log);
> > > +};
> > > +
> > > +#define NVIF_LOGS_DECLARE(_log) \
> > > +	struct nvif_log _log = { LIST_HEAD_INIT(_log.entry) }
> > 
> > If you declare this as
> > 
> > 	#define NVIF_LOGS_DECLARE(_log) \
> > 		struct nvif_log _log = { LIST_HEAD_INIT(_log.entry), nvif_log_shutdown }
> > 
> > and change the signature of nvif_log_shutdown() to
> > 
> > 	static inline void nvif_log_shutdown(struct nvif_log *logs)
> > 
> > you can just call
> > 
> > 	gsp_logs.shutdown(&gsp_logs);
> > 
> > in nouveau_drm_exit().
> > 
> > Admittedly, maybe a bit too sneaky though. :)
> 
> gsp_logs.shutdown(&gsp_logs) -- are you sure you want this?  This is some
> weird C++ wanna-be code, IMHO.  I don't think this is an improvement.  I'd
> rather keep it as-is.

That's why I wrote "maybe a bit too sneaky". :)

I think what I asked for originally in one of the last versions of this patch
is having both, struct nvif_log (exactly the way you have it) and a separate
struct nvif_logs:

	struct nvif_logs {
		struct list_head head;
	};

Then you use this in NVIF_LOGS_DECLARE() and nvif_log_shutdown()

	static inline void nvif_log_shutdown(struct nvif_logs *logs)

and in nouveau_drm_exit() you just pass &gsp_logs.

	nvif_log_shutdown(&gsp_logs);

This way things are more type safe, i.e. nvif_log_shutdown() can't be called
with a random list_head and struct nvif_log::shutdown can't be called with the
"head instance" of struct struct nvif_log.

> 
> > > +/*
> > > + * GSP-RM uses a pseudo-class mechanism to define of a variety of per-"engine"
> > > + * data structures, and each engine has a "class ID" genererated by a
> > > + * pre-processor. This is the class ID for the PMU.
> > > + */
> > > +#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
> > > +
> > > +/**
> > > + * rpc_ucode_libos_print_v1E_08 - RPC payload for libos print buffers
> > 
> > Is this structure versioned? If so, does it relate to a specific GSP-RM version?
> 
> Yes, the structure is versioned, but it's a little weird.  When a new RPC is
> added, the developer can choose to use any version number that matches the
> "current" VGPU version or earlier.  src/nvidia/generated/g_rpc-structures.h
> is generated from a special "def" file, and the developer just chooses
> whatever number he wants.  Typically, the developer will choose whatever
> version that VGPU is at when he starts working on the code.  But since this
> is the first and only version of rpc_ucode_libos_print, he could have chosen
> v01_00.
> 
> So "previous RPC version (if it exists)" < "new RPC version" <= "current
> VGPU version" at the time the RPC was created/updated.

Pretty interesting, thanks for clarifying! (No need to document it though.)

> > > +static void r535_gsp_retain_logging(struct nvkm_gsp *gsp)
> > > +{
> > > +	struct device *dev = gsp->subdev.device->dev;
> > > +	struct dentry *root, *dir;
> > > +	struct r535_gsp_log *log;
> > > +	int ret;
> > > +
> > > +	/* If we were told not to keep logs, then don't. */
> > > +	if (!keep_gsp_logging)
> > > +		return;
> > > +
> > > +	/* Check to make sure at least one buffer has data. */
> > > +	if (is_empty(&gsp->blob_init) && is_empty(&gsp->blob_intr) &&
> > > +	    is_empty(&gsp->blob_rm) && is_empty(&gsp->blob_rm)) {
> > > +		nvkm_warn(&gsp->subdev, "all logging buffers are empty\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/* Find the 'dri' root debugfs entry. Every GPU has a dentry under it */
> > > +	root = debugfs_lookup("dri", NULL);
> > > +	if (IS_ERR(root)) {
> > 
> > I don't think this can ever happen. This entry is created in drm_core_init().

Oh, I see how this reads. I think I didn't quite finish the reply. Sorry for the
confusion.

> 
> So first, the check is wrong.  It should be "if (!root)".

That's what I meant, it can't be an ERR_PTR.

> 
> However, I think it can happen.  drm_core_init() does not fail if
> debugfs_create_dir() fails:
> 
> 	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> 
> It doesn't even print a warning message.  It just keeps going.  So I think
> there should be some error checking somewhere.

For DRM probably not, since the ERR_PTR is honored by other debugfs functions
as described in [1].

> 
> I tested this, and if drm_core_init() fails to create the dentry, then
> r535_gsp_retain_logging() will just keep going trying to create debugfs
> entries, because a root of NULL is actually valid, and the entries are
> created in /sys/kernel/debug/0000:65:00.0/ instead of
> /sys/kernel/debug/dri/0000:65:00.0/

This is because debugfs_lookup() doesn't return an ERR_PTR, but NULL. It'd
probably better go along with what is documented in [1] if debugfs_lookup()
would return ERR_PTR(-ENOENT) if no entry was found.

(This is where I was heading to in my previous reply.)

> 
> In fact, I think I found a small bug in dput():
> 
> void dput(struct dentry *dentry)
> {
> 	if (!dentry)
> 		return;
> 
> This should probably be "if (IS_ERR_OR_NULL(dentry))".

Yes, I agree, good catch.

[1] https://elixir.bootlin.com/linux/v6.10/source/fs/debugfs/inode.c#L586
