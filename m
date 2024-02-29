Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B986D6B2
	for <lists+nouveau@lfdr.de>; Thu, 29 Feb 2024 23:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D273310E657;
	Thu, 29 Feb 2024 22:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IvzVzhOE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4B10E65D
 for <nouveau@lists.freedesktop.org>; Thu, 29 Feb 2024 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709244945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxzxylpBcQrFOzJNsTe++esQjoo61/Ju2PmGLlHu4fA=;
 b=IvzVzhOEr9iy7kR1beu4HWwbKaHo4GA4XtVg1RVvzmksQVI3PQAwHOWcrDxucd4yETfLjM
 ZKIkYMDmqpK8SYrbGg2x6ruDAJI3l79V9IX0tLKdH4qKGFdYayQCfr7xdZ138arQvTEkJH
 jsEJwaNNIQYvWp/uzmLI5nbgXzhEDSI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-d4x_7ClgNRaz0tziaDsFWg-1; Thu, 29 Feb 2024 17:15:44 -0500
X-MC-Unique: d4x_7ClgNRaz0tziaDsFWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33dcd5d117fso733710f8f.1
 for <nouveau@lists.freedesktop.org>; Thu, 29 Feb 2024 14:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709244943; x=1709849743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxzxylpBcQrFOzJNsTe++esQjoo61/Ju2PmGLlHu4fA=;
 b=Zh4UqUi4z4fDFX8VREUU0fXSQvk/dq+Xk/+pglUlfllTl7v3/kEVDTKBUgM8YlLiYB
 rNdALInGVWEhV3L+fVWgXXPfI/AUoC08m7mAQieBhCqWbRmBsahDF/D3wO3gEYHCgF6q
 Ka+26oDWJWHDqa84hPP4M/c7qi0tzzK7e6sKvXOA4W8iP2wiwqur14v2oscpAVBBud0I
 BQziLXfZXYrHVASWtiesfC+Ab048A2Gn991L+vH6Q6YslVczjVm3HKK4hajrAAmVuJWn
 a9a/ENbit4VedGPfpc1O6B1xs+gI7zx/8VtouCw9PiQ8Fj5yoVMphQV1bqO8P90e/Bo+
 4qdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUReNc1dlFqcWrqknVvwGGqodLMLkCRkjVqNFkar+rVmDpkj5XkIdH//ns1VzMu7pwbIOYl/WfY0Eg0ClvogXCO6GQWIcglf8OTplrqlw==
X-Gm-Message-State: AOJu0Yw7unSvTlVrOZuD44KWOG+x0wE2iXdteuriVafCOIMKiEtBaAnS
 uhgDVYhT0lsrDa53BEE6rzWPaVBCj810AtLbrVUXHsyy8kXejhpCby7WncmEYxtGKnnvrT3F3zi
 IU1WfMzedQnSXNIArBQtlFG54a2bvbwv/bB+6nDmk9ltK7T58l1+1WjVucoPqXvY=
X-Received: by 2002:adf:cb8a:0:b0:33d:90c2:c7f4 with SMTP id
 q10-20020adfcb8a000000b0033d90c2c7f4mr287096wrh.14.1709244943312; 
 Thu, 29 Feb 2024 14:15:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcz9vGXGguaieMpWLarYYaVZdAygPksN14G0npU71tonoiQj+m0rH5nPM+eA44z8+uASZcPQ==
X-Received: by 2002:adf:cb8a:0:b0:33d:90c2:c7f4 with SMTP id
 q10-20020adfcb8a000000b0033d90c2c7f4mr287084wrh.14.1709244942879; 
 Thu, 29 Feb 2024 14:15:42 -0800 (PST)
Received: from hs01.dakr.org (hs01.dk-develop.de. [2a02:c207:3002:6234::1])
 by smtp.gmail.com with ESMTPSA id
 j3-20020adff003000000b0033e01e397d6sm2821355wro.54.2024.02.29.14.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 14:15:42 -0800 (PST)
Date: Thu, 29 Feb 2024 23:15:37 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH] [v4][RFC] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Message-ID: <ZeECCUuvuVetee3s@hs01.dakr.org>
References: <20240226210245.4022456-1-ttabi@nvidia.com>
 <510003da-0641-4dea-84ee-3b686644583c@redhat.com>
 <53f13b26c43447981668232ff27ce4211c4b6197.camel@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <53f13b26c43447981668232ff27ce4211c4b6197.camel@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Tue, Feb 27, 2024 at 05:27:54PM +0000, Timur Tabi wrote:
> On Tue, 2024-02-27 at 15:20 +0100, Danilo Krummrich wrote:
> > Hi Timur,
> > 
> > thanks for re-working this patch!
> > 
> > On 2/26/24 22:02, Timur Tabi wrote:
> > > The LOGINIT, LOGINTR, LOGRM, and LOGPMU buffers are circular buffers
> > > that have printf-like logs from GSP-RM and PMU encoded in them.
> > > 
> > > LOGINIT, LOGINTR, and LOGRM are allocated by Nouveau and their DMA
> > > addresses are passed to GSP-RM during initialization.  The buffers are
> > > required for GSP-RM to initialize properly.
> > > 
> > > LOGPMU is also allocated by Nouveau, but its contents are updated
> > > when Nouveau receives an NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPC from
> > > GSP-RM.  Nouveau then copies the RPC to the buffer.
> > > 
> > > The messages are encoded as an array of variable-length structures that
> > > contain the parameters to an NV_PRINTF call.  The format string and
> > > parameter count are stored in a special ELF image that contains only
> > > logging strings.  This image is not currently shipped with the Nvidia
> > > driver.
> > > 
> > > There are two methods to extract the logs.
> > > 
> > > OpenRM tries to load the logging ELF, and if present, parses the log
> > > buffers in real time and outputs the strings to the kernel console.
> > > 
> > > Alternatively, and this is the method used by this patch, the buffers
> > > can be exposed to user space, and a user-space tool (along with the
> > > logging ELF image) can parse the buffer and dump the logs.
> > > 
> > > This method has the advantage that it allows the buffers to be parsed
> > > even when the logging ELF file is not available to the user.  However,
> > > it has the disadvantage the debubfs entries need to remain until the
> > 
> > Typo in "debugfs".
> 
> Thanks.
> 
> > 
> > > driver is unloaded.
> > > 
> > > The buffers are exposed via debugfs.  The debugfs entries must be
> > > created before GSP-RM is started, to ensure that they are available
> > > during GSP-RM initialization.
> > 
> > Generally agree. Just wondering why you are pointing this out
> > explicitly.
> 
> There is so much about GSP-RM initialization that is undocumented that I
> just like documenting as much as I can.  
> 
> Now that I think about, that statement isn't technically true.  If you don't
> have debugfs at all, GSP-RM will still boot.  I'll delete it.
> 
> > What if we'd create them directly after GSP init? Is there anything
> > subtle to that?
> 
> No.  I supposed we could technically create them later, I just don't see an
> advantage to that.  
> 
> > > If GSP-RM fails to initialize, then Nouveau immediately shuts down
> > > the GSP interface.  This would normally also deallocate the logging
> > > buffers, thereby preventing the user from capturing the debug logs.
> > > To avoid this, use the keep-gsp-logging command line parameter.  If
> > 
> > "introduce the keep-gsp-logging command line parameter"
> 
> Ok.
> 
> > > specified, and if at least one logging buffer has contents, then
> > > Nouveau will migrate these buffers into new debugfs entries that are
> > > retained until the driver unloads.
> > > 
> > > An end-user can capture the logs using the following commands:
> > > 
> > >      cp /sys/kernel/debug/dri/<path>/loginit loginit
> > >      cp /sys/kernel/debug/dri/<path>/logrm logrm
> > >      cp /sys/kernel/debug/dri/<path>/logintr logintr
> > >      cp /sys/kernel/debug/dri/<path>/logpmu logpmu
> > > 
> > > where <path> is the PCI ID of the GPU (e.g. 0000:65:00.0).
> > > 
> > > Since LOGPMU is not needed for normal GSP-RM operation, it is only
> > > created if debugfs is available.  Otherwise, the
> > > NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.
> > 
> > The commit message and some DOC comments contains trailing spaces 
> > between words.
> 
> Ok, I'll review and fix.
> 
> > >   
> > > +/**
> > > + * nvkm_gsp_log - structure for tracking GSP-RM logging buffers
> > > + * @head: list head
> > > + * @shutdown: pointer to function to call to clean up
> > > + *
> > > + * One of these is created for each GPU upon GSP shutdown if the
> > > + * "keep_gsp_logging" command-line parameter is specified.  This is used to
> > > + * track the alternative debugfs entries for the GSP-RM logs.
> > > + */
> > > +struct nvkm_gsp_log {
> > 
> > Maybe better to name this structure nvif_log instead and move it to
> > include/nvif/log.h for consistency. It's not really limited GSP,
> > although I don't see what else it could ever be used for.
> 
> Well, that's why I named it that.  But technically it's not even limited to
> logging.  It would be nice if the kernel had a general mechanism for
> callbacks on driver exit, like it does for system shutdown.
> 
> I supposed I could create a notifier chain instead.  How about that?

Not sure if we need to generalize it even more, but I'm fine with that too. I'd
just want to keep nvif as interface for consistency.

> 
> > > +	dir_init = debugfs_create_blob("loginit", 0444, dir, &gsp->blob_init);
> > > +	if (IS_ERR(dir_init)) {
> > > +		nvkm_error(&gsp->subdev, "failed to create loginit debugfs entry\n");
> > > +		goto error;
> > 
> > If we hit this, dir_intr and dir_rm are uninitialized.
> 
> Thanks!
> 
> > >   
> > > +#ifdef CONFIG_DEBUG_FS
> > > +
> > > +/*
> > > + * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
> > > + * logging debugfs entries will be deleted, and it will not be possible to
> > > + * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
> > > + * to copy the logging buffers to new debugfs entries, and these entries are
> > > + * retained until the driver unloads.
> > > + */
> > > +static bool keep_gsp_logging;
> > > +module_param(keep_gsp_logging, bool, 0444);
> > > +MODULE_PARM_DESC(keep_gsp_logging,
> > > +		 "Migrate the GSP-RM logging debugfs entries upon exit");
> > 
> > What if we start supporting multiple firmware versions? I think we
> > should move this module_param() either into nouveau_drm.c and pipe it
> > through nvkm_device_ctor() or move to nvkm/engine/device/base.c and add
> > it to struct nvkm_device there.
> 
> I'm not fond of moving GSP-specific code into non-GSP files.

I'm not worried too much about that. In fact, I even prefer having module params
in a single place, wrap them in a global structure such that it can be easily
distributed throughout the module. However, that's not what Nouveau does.

> 
> I don't see how supporting multiple versions would change things.  I'm
> assuming you're talking about having the driver support r535 and r550, for
> example.  In that case, if an r550 gsp.bin is present, then the driver will
> use that for all GPUs instead of r535.  The command-line parameter would
> apply to all GPUs anyway.

We might need a r550.c then, since we'd need to deal with the different header
files if we don't have an abstraction layer yet. However, that's a huge rework
either way. So, I'm fine keeping it here and move it once needed.

> 
> Also keep in mind that this option is much safer than in the original
> version of my patch.  In fact, I was debating changing the code so that, if
> it detects that GSP-RM failed to initialize, then automatically migrate the
> debugfs entries, no command-line option needed.
> 
> > > +// FIXME: This should be in a header file
> > > +extern struct list_head gsp_logs;
> > 
> > What about include/nvif/log.h? :-)
> 
> Sure.
> 
> > > +struct r535_gsp_log {
> > 
> > Guess we need this abstraction, since we expect that a different
> > firmware version might change the available log buffers?
> 
> Yes, that was my thinking.  We have changed the buffers before, and I think
> we might change them again.  
> 
> > > +/**
> > > + * is_empty - return true if the logging buffer was never written to
> > > + * @b: blob wrapper with ->data field pointing to logging buffer
> > > + *
> > > + * The first 64-bit field of loginit, and logintr, and logrm is the 'put'
> > > + * pointer, and it is initialized to 0.  If the pointer is still 0 when
> > > + * GSP-RM is shut down, that means that it was never written do, so it
> > > + * can be ignored.
> > > + *
> > > + * This test also works for logpmu, even though it doesn't have a put pointer.
> > > + */
> > > +static bool is_empty(struct debugfs_blob_wrapper *b)
> > > +{
> > > +	uint64_t *put = b->data;
> > 
> > Better use u64.
> 
> Ok
> 
> > 
> > > +	/* Find the 'dri' root debugfs entry. Every GPU has a dentry under it */
> > > +	root = debugfs_lookup("dri", NULL);
> > > +	if (IS_ERR(root)) {
> > > +		/* No debugfs, or no root dentry for DRM */
> > 
> > Maybe print a warning as well?
> 
> Sure.
> 
> > > +	/* Create a new debugfs root. It has the same name as the old one */
> > > +	dir = debugfs_create_dir(dev_name(dev), root);
> > > +	dput(root);
> > > +	if (IS_ERR(dir)) {
> > > +		nvkm_error(&gsp->subdev,
> > > +			"failed to create %s debugfs entry\n", dev_name(dev));
> > > +		return;
> > > +	}
> > > +
> > > +	log = devm_kzalloc(dev, sizeof(*log), GFP_KERNEL);
> > 
> > What if the PCI device is removed before the module is removed?
> 
> Ah, for some reason I had it in my head that devm was attached to the
> driver, not the device.  Which is dumb, because it literally takes a struct
> device *.
> 
> > I think we should just free it in nouveau_drm_exit(). As long as
> > we keep the convention that struct nvif_log is the first member we 
> > should be fine. Otherwise we could also just add ::free() callback,
> > like we have ::shutdown(), which seems to be safer.
> 
> Ok, I'll try to come up with something.
> > 

