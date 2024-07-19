Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A67937773
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 14:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EA310EBFC;
	Fri, 19 Jul 2024 12:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jdgf2LQ/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45ADD10EBFC
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721390825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gmn7gFc3wZrDLvoMlDcE8/FEA5cOINlhS5ce7aG+mhU=;
 b=Jdgf2LQ/gXSfmozsHJh0iHZRRmA4o+Tm3SkZ9pKsvQ2fOsWGnohPVxRT+/8ZbCXvz4P8Y4
 AV3vsW+eOqARcXiR/SjtEGYKx3d5Z+XJgIIvhBGAZdavFIq0zTIO3NrBt5kKSjwOIhWsh1
 fNniwQ9HOjVvjivC2pHu8wihylF+6dY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-N0jVY4lhNumkAn_285uBag-1; Fri, 19 Jul 2024 08:07:04 -0400
X-MC-Unique: N0jVY4lhNumkAn_285uBag-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3687a1a6846so428738f8f.3
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721390822; x=1721995622;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gmn7gFc3wZrDLvoMlDcE8/FEA5cOINlhS5ce7aG+mhU=;
 b=ho+ALwVZz9y+LXKquaJV3xnhtr4fNQMBkIf9PjkmMoAQCfEWVRy0qec6AEReqQS+Ax
 9EYDw4yVbqDvGQPwf/kCmxfp0+BtPXJWzOULdpI9QTqrC8PdN6JBs597enXkYPjgWdte
 DmoOhx5jvALdHZDd+ZBnsbiQf15wOUjYeGB1uokU4v9ry8RuoZthSGBLP7OmktpR9DKM
 9Z8I4V/yDBkDVUat3GG5XU4habWgXLJCAXEGBRWdRoyu6xcUk/UZaYOroN7uZxzqHiFH
 YjQYmetJfzF9OCxps3nIB8/HiwqKbFTLLdfGoIrtTp4uikc4thDmLEJ0mTkcKC8Z0d1+
 tSZg==
X-Gm-Message-State: AOJu0Yzshcypw1uBI8GU4pS1HdfCmnDbrDCCF2ne31bLuX8kQgl7JQK2
 9jge4z4wJUrRnd9IVWs0VsZiCJ9UodAve8gC5/llrOxrFOQ5C1AR8TzTdtua8eLYGT/nMcgGulE
 4Go0TwGLcsZcniD2wYZvZ1KBiPnSSk4QwYUEuTL3oC0kty4D/3fINbTibLJNUe/A=
X-Received: by 2002:adf:fa03:0:b0:366:ec2f:dbc9 with SMTP id
 ffacd0b85a97d-368316fab71mr4995285f8f.51.1721390822627; 
 Fri, 19 Jul 2024 05:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE3JpdnWt/OoqFTHXGMoP34qwkjuJZXeR6vJe85+mm2DHVye3TJuSxxsBICl+wUo/UTkJ/pg==
X-Received: by 2002:adf:fa03:0:b0:366:ec2f:dbc9 with SMTP id
 ffacd0b85a97d-368316fab71mr4995265f8f.51.1721390822055; 
 Fri, 19 Jul 2024 05:07:02 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868b7d9sm1446299f8f.42.2024.07.19.05.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 05:07:01 -0700 (PDT)
Date: Fri, 19 Jul 2024 14:06:59 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 08/37] drm/nouveau: handle limited nvif ioctl in abi16
Message-ID: <ZppW4yI2MEZJ4ZQi@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-9-bskeggs@nvidia.com>
 <Zo1fTLZeyZps-E37@pollux>
 <b8ccfc88-6666-4532-921a-2dadfc93eccb@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <b8ccfc88-6666-4532-921a-2dadfc93eccb@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Jul 18, 2024 at 05:43:20PM +1000, Ben Skeggs wrote:
> On 10/7/24 02:03, Danilo Krummrich wrote:
> 
> > On Fri, Jul 05, 2024 at 04:36:52AM +1000, Ben Skeggs wrote:
> > > nouveau_usif.c was already stripped right back a couple of years ago,
> > > limiting what userspace could do with it, and now I'd like to remove
> > > the nvkm side of these interfaces entirely, in order to make it less
> > > of a nightmare to add/change internal APIs in the future.
> > > 
> > > Unfortunately.  Userspace uses some of this.
> > > 
> > > Fortunately, userspace only ever ended up using a fraction of the APIs,
> > > so I've reimplemented those in a more direct manner, and return -EINVAL
> > > to userspace for everything else.
> > Please use imperative form.
> > 
> > > v2:
> > > - simplified struct nouveau_abi16_obj
> > > - added a couple of comments
> > > 
> > > Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/Kbuild          |   1 -
> > >   drivers/gpu/drm/nouveau/nouveau_abi16.c | 277 ++++++++++++++++++++----
> > >   drivers/gpu/drm/nouveau/nouveau_abi16.h |   3 +-
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c   |   5 +-
> > >   drivers/gpu/drm/nouveau/nouveau_nvif.c  |   1 -
> > >   drivers/gpu/drm/nouveau/nouveau_usif.c  | 194 -----------------
> > >   drivers/gpu/drm/nouveau/nouveau_usif.h  |  10 -
> > >   7 files changed, 242 insertions(+), 249 deletions(-)
> > >   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
> > >   delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
> > > index c32c01827c1d..7b863355c5c6 100644
> > > --- a/drivers/gpu/drm/nouveau/Kbuild
> > > +++ b/drivers/gpu/drm/nouveau/Kbuild
> > > @@ -25,7 +25,6 @@ nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
> > >   nouveau-$(CONFIG_LEDS_CLASS) += nouveau_led.o
> > >   nouveau-y += nouveau_nvif.o
> > >   nouveau-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
> > > -nouveau-y += nouveau_usif.o # userspace <-> nvif
> > >   nouveau-y += nouveau_vga.o
> > >   # DRM - memory management
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > index ac50c300d2eb..f80d777cee5d 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > @@ -52,6 +52,7 @@ nouveau_abi16(struct drm_file *file_priv)
> > >   			abi16->cli = cli;
> > >   			INIT_LIST_HEAD(&abi16->channels);
> > > +			INIT_LIST_HEAD(&abi16->objects);
> > >   			/* allocate device object targeting client's default
> > >   			 * device (ie. the one that belongs to the fd it
> > > @@ -88,6 +89,58 @@ nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
> > >   	return ret;
> > >   }
> > > +/* Tracks objects created via nvif_ioctl_v0 APIs. */
> > Here I asked about some documentation on the semantical meaning of this object,
> > as in "What does it represent?".
> > 
> > The fact this it is created via some generic nvif_ioctl_v0 interface may be part
> > of an explanation, but with only that information I doubt that anyone who does
> > not know already) is capabale to make any sense of this structure.
> > 
> > Try to answer the following questions:
> > 
> > 1. What kind of object does it track? What do they represent?
> > 2. For generic objects, what would be examples for specific ones?
> > 3. Where do the objects originate from?
> > 4. What is a "DEVICE" object and what is an "ENGOBJ"? Do we have documentation
> >     we can point to already for that?
> > 
> > If we'd want to go even more crazy, we could ask:
> > 1. Who owns those objects, once created?
> > 2. What are their lifetime rules?
> > 3. How do we ensure we don't violate lifetime rules?
> 
> I hear what you're saying.  It just doesn't make sense here.  A lot of the
> questions you ask, particularly in the first section, relate to general
> concepts present throughout not only the entire driver, but GSP-RM's
> interfaces and even the HW itself.  Attaching all of this to a chunk of code
> simulating a tiny fraction of a bad idea that got exposed to userspace is
> not where this kind of information belongs.

I'm not asking you to answer all those questions to the maximum extend
possible, especially not in this random place.

Instead those questions are intended as a hint on what to think of when trying
to write some documentation for this structure.

So, effectively you're saying that you can't explain what this structure is
about, without explaining the whole driver architecture, GSP-RM, and even the
HW.

And to a certain extend I agree, it is indeed a bit difficult, since we don't
have general documentation we can tie a brief explanation back to, neither for
the driver architecture, nor for this uAPI.

As you mention below, you plan to write up some general driver architecture
documentation, that should cover the key concepts. It won't cover this specific
structure however.

Please try to come up with a few lines for struct nouveau_abi16_obj
specifically. When you get to the point where things should be covered by the
general driver architecture documentation, just stop and leave it there.

Now, I understand that it may feel a bit random, but we have to start somewhere.

> 
> I've spoken to you already about adding documentation to the remove-ioctl
> series as the layers are ripped out of each NVIF API, as well as some
> general hw/driver architecture documentation before I send a v2 of that
> series.  That will help clear up a lot of these type of questions.  Does
> that sound OK?
> 
> > 
> > > +struct nouveau_abi16_obj {
> > > +	enum nouveau_abi16_obj_type {
> > > +		DEVICE,
> > > +		ENGOBJ,
> > > +	} type;
> > > +	u64 object;
> > > +
> > > +	struct nvif_object engobj;
> > > +
> > > +	struct list_head head; /* protected by nouveau_abi16.cli.mutex */
> > > +};
> > > +
> > > +static struct nouveau_abi16_obj *
> > > +nouveau_abi16_obj_find(struct nouveau_abi16 *abi16, u64 object)
> > > +{
> > > +	struct nouveau_abi16_obj *obj;
> > > +
> > > +	list_for_each_entry(obj, &abi16->objects, head) {
> > > +		if (obj->object == object)
> > > +			return obj;
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +static void
> > > +nouveau_abi16_obj_del(struct nouveau_abi16_obj *obj)
> > > +{
> > > +	list_del(&obj->head);
> > > +	kfree(obj);
> > > +}
> > > +
> > > +static struct nouveau_abi16_obj *
> > > +nouveau_abi16_obj_new(struct nouveau_abi16 *abi16, enum nouveau_abi16_obj_type type, u64 object)
> > > +{
> > > +	struct nouveau_abi16_obj *obj;
> > > +
> > > +	obj = nouveau_abi16_obj_find(abi16, object);
> > > +	if (obj)
> > > +		return ERR_PTR(-EEXIST);
> > > +
> > > +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> > > +	if (!obj)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	obj->type = type;
> > > +	obj->object = object;
> > > +	list_add_tail(&obj->head, &abi16->objects);
> > > +	return obj;
> > > +}
> > > +
> > >   s32
> > >   nouveau_abi16_swclass(struct nouveau_drm *drm)
> > >   {
> > > @@ -167,6 +220,12 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
> > >   {
> > >   	struct nouveau_cli *cli = abi16->cli;
> > >   	struct nouveau_abi16_chan *chan, *temp;
> > > +	struct nouveau_abi16_obj *obj, *tmp;
> > > +
> > > +	/* cleanup objects */
> > > +	list_for_each_entry_safe(obj, tmp, &abi16->objects, head) {
> > > +		nouveau_abi16_obj_del(obj);
> > > +	}
> > >   	/* cleanup channels */
> > >   	list_for_each_entry_safe(chan, temp, &abi16->channels, head) {
> > > @@ -458,44 +517,6 @@ nouveau_abi16_chan(struct nouveau_abi16 *abi16, int channel)
> > >   	return NULL;
> > >   }
> > > -int
> > > -nouveau_abi16_usif(struct drm_file *file_priv, void *data, u32 size)
> > > -{
> > > -	union {
> > > -		struct nvif_ioctl_v0 v0;
> > > -	} *args = data;
> > > -	struct nouveau_abi16_chan *chan;
> > > -	struct nouveau_abi16 *abi16;
> > > -	int ret = -ENOSYS;
> > > -
> > > -	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
> > > -		switch (args->v0.type) {
> > > -		case NVIF_IOCTL_V0_NEW:
> > > -		case NVIF_IOCTL_V0_MTHD:
> > > -		case NVIF_IOCTL_V0_SCLASS:
> > > -			break;
> > > -		default:
> > > -			return -EACCES;
> > > -		}
> > > -	} else
> > > -		return ret;
> > > -
> > > -	if (!(abi16 = nouveau_abi16(file_priv)))
> > > -		return -ENOMEM;
> > > -
> > > -	if (args->v0.token != ~0ULL) {
> > > -		if (!(chan = nouveau_abi16_chan(abi16, args->v0.token)))
> > > -			return -EINVAL;
> > > -		args->v0.object = nvif_handle(&chan->chan->user);
> > > -		args->v0.owner  = NVIF_IOCTL_V0_OWNER_ANY;
> > > -		return 0;
> > > -	}
> > > -
> > > -	args->v0.object = nvif_handle(&abi16->device.object);
> > > -	args->v0.owner  = NVIF_IOCTL_V0_OWNER_ANY;
> > > -	return 0;
> > > -}
> > > -
> > >   int
> > >   nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS)
> > >   {
> > > @@ -705,3 +726,183 @@ nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS)
> > >   	return nouveau_abi16_put(abi16, ret);
> > >   }
> > > +
> > > +static int
> > > +nouveau_abi16_ioctl_mthd(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
> > > +{
> > > +	struct nouveau_cli *cli = abi16->cli;
> > > +	struct nvif_ioctl_mthd_v0 *args;
> > > +	struct nouveau_abi16_obj *obj;
> > > +	struct nv_device_info_v0 *info;
> > > +
> > > +	if (ioctl->route || argc < sizeof(*args))
> > > +		return -EINVAL;
> > > +	args = (void *)ioctl->data;
> > > +	argc -= sizeof(*args);
> > > +
> > > +	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
> > > +	if (!obj || obj->type != DEVICE)
> > > +		return -EINVAL;
> > > +
> > > +	if (args->method != NV_DEVICE_V0_INFO ||
> > > +	    argc != sizeof(*info))
> > > +		return -EINVAL;
> > > +
> > > +	info = (void *)args->data;
> > > +	if (info->version != 0x00)
> > > +		return -EINVAL;
> > > +
> > > +	info = &cli->device.info;
> > > +	memcpy(args->data, info, sizeof(*info));
> > > +	return 0;
> > > +}
> > > +
> > > +static int
> > > +nouveau_abi16_ioctl_del(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
> > > +{
> > > +	struct nouveau_abi16_obj *obj;
> > > +
> > > +	if (ioctl->route || argc)
> > > +		return -EINVAL;
> > > +
> > > +	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
> > > +	if (obj) {
> > > +		if (obj->type == ENGOBJ)
> > > +			nvif_object_dtor(&obj->engobj);
> > > +		nouveau_abi16_obj_del(obj);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int
> > > +nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
> > > +{
> > > +	struct nvif_ioctl_new_v0 *args;
> > > +	struct nouveau_abi16_chan *chan;
> > > +	struct nouveau_abi16_obj *obj;
> > > +	int ret;
> > > +
> > > +	if (argc < sizeof(*args))
> > > +		return -EINVAL;
> > > +	args = (void *)ioctl->data;
> > > +	argc -= sizeof(*args);
> > > +
> > > +	if (args->version != 0)
> > > +		return -EINVAL;
> > > +
> > > +	if (!ioctl->route) {
> > > +		if (ioctl->object || args->oclass != NV_DEVICE)
> > > +			return -EINVAL;
> > > +
> > > +		obj = nouveau_abi16_obj_new(abi16, DEVICE, args->object);
> > > +		if (IS_ERR(obj))
> > > +			return PTR_ERR(obj);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	chan = nouveau_abi16_chan(abi16, ioctl->token);
> > > +	if (!chan)
> > > +		return -EINVAL;
> > > +
> > > +	obj = nouveau_abi16_obj_new(abi16, ENGOBJ, args->object);
> > > +	if (IS_ERR(obj))
> > > +		return PTR_ERR(obj);
> > > +
> > > +	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", args->handle, args->oclass,
> > > +			       NULL, 0, &obj->engobj);
> > > +	if (ret)
> > > +		nouveau_abi16_obj_del(obj);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int
> > > +nouveau_abi16_ioctl_sclass(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
> > > +{
> > > +	struct nvif_ioctl_sclass_v0 *args;
> > > +	struct nouveau_abi16_chan *chan;
> > > +	struct nvif_sclass *sclass;
> > > +	int ret;
> > > +
> > > +	if (!ioctl->route || argc < sizeof(*args))
> > > +		return -EINVAL;
> > > +	args = (void *)ioctl->data;
> > > +	argc -= sizeof(*args);
> > > +
> > > +	if (argc != args->count * sizeof(args->oclass[0]))
> > > +		return -EINVAL;
> > > +
> > > +	chan = nouveau_abi16_chan(abi16, ioctl->token);
> > > +	if (!chan)
> > > +		return -EINVAL;
> > > +
> > > +	ret = nvif_object_sclass_get(&chan->chan->user, &sclass);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	for (int i = 0; i < min_t(u8, args->count, ret); i++) {
> > > +		args->oclass[i].oclass = sclass[i].oclass;
> > > +		args->oclass[i].minver = sclass[i].minver;
> > > +		args->oclass[i].maxver = sclass[i].maxver;
> > > +	}
> > > +	args->count = ret;
> > > +
> > > +	nvif_object_sclass_put(&sclass);
> > > +	return 0;
> > > +}
> > > +
> > > +int
> > > +nouveau_abi16_ioctl(struct drm_file *filp, void __user *user, u32 size)
> > Actually, it would also be good to add documentation on what this uAPI provides
> > and how it works. But since this patch just moves things over, I don't think
> > it's required for this patch.
> > 
> > > +{
> > > +	struct nvif_ioctl_v0 *ioctl;
> > > +	struct nouveau_abi16 *abi16;
> > > +	u32 argc = size;
> > > +	int ret;
> > > +
> > > +	if (argc < sizeof(*ioctl))
> > > +		return -EINVAL;
> > > +	argc -= sizeof(*ioctl);
> > > +
> > > +	ioctl = kmalloc(size, GFP_KERNEL);
> > > +	if (!ioctl)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = -EFAULT;
> > > +	if (copy_from_user(ioctl, user, size))
> > > +		goto done_free;
> > > +
> > > +	if (ioctl->version != 0x00 ||
> > > +	    (ioctl->route && ioctl->route != 0xff)) {
> > > +		ret = -EINVAL;
> > > +		goto done_free;
> > > +	}
> > > +
> > > +	abi16 = nouveau_abi16_get(filp);
> > > +	if (unlikely(!abi16)) {
> > > +		ret = -ENOMEM;
> > > +		goto done_free;
> > > +	}
> > > +
> > > +	switch (ioctl->type) {
> > > +	case NVIF_IOCTL_V0_SCLASS: ret = nouveau_abi16_ioctl_sclass(abi16, ioctl, argc); break;
> > > +	case NVIF_IOCTL_V0_NEW   : ret = nouveau_abi16_ioctl_new   (abi16, ioctl, argc); break;
> > > +	case NVIF_IOCTL_V0_DEL   : ret = nouveau_abi16_ioctl_del   (abi16, ioctl, argc); break;
> > > +	case NVIF_IOCTL_V0_MTHD  : ret = nouveau_abi16_ioctl_mthd  (abi16, ioctl, argc); break;
> > > +	default:
> > > +		ret = -EINVAL;
> > > +		break;
> > > +	}
> > > +
> > > +	nouveau_abi16_put(abi16, 0);
> > > +
> > > +	if (ret == 0) {
> > > +		if (copy_to_user(user, ioctl, size))
> > > +			ret = -EFAULT;
> > > +	}
> > > +
> > > +done_free:
> > > +	kfree(ioctl);
> > > +	return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > > index 0a9121e63143..75a883a44e04 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> > > @@ -34,13 +34,14 @@ struct nouveau_abi16 {
> > >   	struct nvif_device device;
> > >   	struct list_head channels;
> > >   	u64 handles;
> > > +	struct list_head objects;
> > >   };
> > >   struct nouveau_abi16 *nouveau_abi16_get(struct drm_file *);
> > >   int  nouveau_abi16_put(struct nouveau_abi16 *, int);
> > >   void nouveau_abi16_fini(struct nouveau_abi16 *);
> > >   s32  nouveau_abi16_swclass(struct nouveau_drm *);
> > > -int  nouveau_abi16_usif(struct drm_file *, void *data, u32 size);
> > > +int nouveau_abi16_ioctl(struct drm_file *, void __user *user, u32 size);
> > >   #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
> > >   #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > index a942d2c03d44..6726f463d2d3 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > @@ -63,7 +63,6 @@
> > >   #include "nouveau_abi16.h"
> > >   #include "nouveau_fence.h"
> > >   #include "nouveau_debugfs.h"
> > > -#include "nouveau_usif.h"
> > >   #include "nouveau_connector.h"
> > >   #include "nouveau_platform.h"
> > >   #include "nouveau_svm.h"
> > > @@ -200,7 +199,6 @@ nouveau_cli_fini(struct nouveau_cli *cli)
> > >   	flush_work(&cli->work);
> > >   	WARN_ON(!list_empty(&cli->worker));
> > > -	usif_client_fini(cli);
> > >   	if (cli->sched)
> > >   		nouveau_sched_destroy(&cli->sched);
> > >   	if (uvmm)
> > > @@ -249,7 +247,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
> > >   	snprintf(cli->name, sizeof(cli->name), "%s", sname);
> > >   	cli->drm = drm;
> > >   	mutex_init(&cli->mutex);
> > > -	usif_client_init(cli);
> > >   	INIT_WORK(&cli->work, nouveau_cli_work);
> > >   	INIT_LIST_HEAD(&cli->worker);
> > > @@ -1267,7 +1264,7 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > >   	switch (_IOC_NR(cmd) - DRM_COMMAND_BASE) {
> > >   	case DRM_NOUVEAU_NVIF:
> > > -		ret = usif_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
> > > +		ret = nouveau_abi16_ioctl(filp, (void __user *)arg, _IOC_SIZE(cmd));
> > >   		break;
> > >   	default:
> > >   		ret = drm_ioctl(file, cmd, arg);
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c b/drivers/gpu/drm/nouveau/nouveau_nvif.c
> > > index 1d49ebdfd5dc..9a7e3f64b79f 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_nvif.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_nvif.c
> > > @@ -35,7 +35,6 @@
> > >   #include <nvif/ioctl.h>
> > >   #include "nouveau_drv.h"
> > > -#include "nouveau_usif.h"
> > >   static void
> > >   nvkm_client_unmap(void *priv, void __iomem *ptr, u32 size)
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.c b/drivers/gpu/drm/nouveau/nouveau_usif.c
> > > deleted file mode 100644
> > > index 002d1479ba89..000000000000
> > > --- a/drivers/gpu/drm/nouveau/nouveau_usif.c
> > > +++ /dev/null
> > > @@ -1,194 +0,0 @@
> > > -/*
> > > - * Copyright 2014 Red Hat Inc.
> > > - *
> > > - * Permission is hereby granted, free of charge, to any person obtaining a
> > > - * copy of this software and associated documentation files (the "Software"),
> > > - * to deal in the Software without restriction, including without limitation
> > > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > > - * and/or sell copies of the Software, and to permit persons to whom the
> > > - * Software is furnished to do so, subject to the following conditions:
> > > - *
> > > - * The above copyright notice and this permission notice shall be included in
> > > - * all copies or substantial portions of the Software.
> > > - *
> > > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > > - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > > - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > > - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > > - * OTHER DEALINGS IN THE SOFTWARE.
> > > - *
> > > - * Authors: Ben Skeggs <bskeggs@redhat.com>
> > > - */
> > > -
> > > -#include "nouveau_drv.h"
> > > -#include "nouveau_usif.h"
> > > -#include "nouveau_abi16.h"
> > > -
> > > -#include <nvif/unpack.h>
> > > -#include <nvif/client.h>
> > > -#include <nvif/ioctl.h>
> > > -
> > > -#include <nvif/class.h>
> > > -#include <nvif/cl0080.h>
> > > -
> > > -struct usif_object {
> > > -	struct list_head head;
> > > -	u8  route;
> > > -	u64 token;
> > > -};
> > > -
> > > -static void
> > > -usif_object_dtor(struct usif_object *object)
> > > -{
> > > -	list_del(&object->head);
> > > -	kfree(object);
> > > -}
> > > -
> > > -static int
> > > -usif_object_new(struct drm_file *f, void *data, u32 size, void *argv, u32 argc, bool parent_abi16)
> > > -{
> > > -	struct nouveau_cli *cli = nouveau_cli(f);
> > > -	struct nvif_client *client = &cli->base;
> > > -	union {
> > > -		struct nvif_ioctl_new_v0 v0;
> > > -	} *args = data;
> > > -	struct usif_object *object;
> > > -	int ret = -ENOSYS;
> > > -
> > > -	if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true)))
> > > -		return ret;
> > > -
> > > -	switch (args->v0.oclass) {
> > > -	case NV_DMA_FROM_MEMORY:
> > > -	case NV_DMA_TO_MEMORY:
> > > -	case NV_DMA_IN_MEMORY:
> > > -		return -EINVAL;
> > > -	case NV_DEVICE: {
> > > -		union {
> > > -			struct nv_device_v0 v0;
> > > -		} *args = data;
> > > -
> > > -		if ((ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false)))
> > > -			return ret;
> > > -
> > > -		args->v0.priv = false;
> > > -		break;
> > > -	}
> > > -	default:
> > > -		if (!parent_abi16)
> > > -			return -EINVAL;
> > > -		break;
> > > -	}
> > > -
> > > -	if (!(object = kmalloc(sizeof(*object), GFP_KERNEL)))
> > > -		return -ENOMEM;
> > > -	list_add(&object->head, &cli->objects);
> > > -
> > > -	object->route = args->v0.route;
> > > -	object->token = args->v0.token;
> > > -	args->v0.route = NVDRM_OBJECT_USIF;
> > > -	args->v0.token = (unsigned long)(void *)object;
> > > -	ret = nvif_client_ioctl(client, argv, argc);
> > > -	if (ret) {
> > > -		usif_object_dtor(object);
> > > -		return ret;
> > > -	}
> > > -
> > > -	args->v0.token = object->token;
> > > -	args->v0.route = object->route;
> > > -	return 0;
> > > -}
> > > -
> > > -int
> > > -usif_ioctl(struct drm_file *filp, void __user *user, u32 argc)
> > > -{
> > > -	struct nouveau_cli *cli = nouveau_cli(filp);
> > > -	struct nvif_client *client = &cli->base;
> > > -	void *data = kmalloc(argc, GFP_KERNEL);
> > > -	u32   size = argc;
> > > -	union {
> > > -		struct nvif_ioctl_v0 v0;
> > > -	} *argv = data;
> > > -	struct usif_object *object;
> > > -	bool abi16 = false;
> > > -	u8 owner;
> > > -	int ret;
> > > -
> > > -	if (ret = -ENOMEM, !argv)
> > > -		goto done;
> > > -	if (ret = -EFAULT, copy_from_user(argv, user, size))
> > > -		goto done;
> > > -
> > > -	if (!(ret = nvif_unpack(-ENOSYS, &data, &size, argv->v0, 0, 0, true))) {
> > > -		/* block access to objects not created via this interface */
> > > -		owner = argv->v0.owner;
> > > -		if (argv->v0.object == 0ULL &&
> > > -		    argv->v0.type != NVIF_IOCTL_V0_DEL)
> > > -			argv->v0.owner = NVDRM_OBJECT_ANY; /* except client */
> > > -		else
> > > -			argv->v0.owner = NVDRM_OBJECT_USIF;
> > > -	} else
> > > -		goto done;
> > > -
> > > -	/* USIF slightly abuses some return-only ioctl members in order
> > > -	 * to provide interoperability with the older ABI16 objects
> > > -	 */
> > > -	mutex_lock(&cli->mutex);
> > > -	if (argv->v0.route) {
> > > -		if (ret = -EINVAL, argv->v0.route == 0xff)
> > > -			ret = nouveau_abi16_usif(filp, argv, argc);
> > > -		if (ret) {
> > > -			mutex_unlock(&cli->mutex);
> > > -			goto done;
> > > -		}
> > > -
> > > -		abi16 = true;
> > > -	}
> > > -
> > > -	switch (argv->v0.type) {
> > > -	case NVIF_IOCTL_V0_NEW:
> > > -		ret = usif_object_new(filp, data, size, argv, argc, abi16);
> > > -		break;
> > > -	default:
> > > -		ret = nvif_client_ioctl(client, argv, argc);
> > > -		break;
> > > -	}
> > > -	if (argv->v0.route == NVDRM_OBJECT_USIF) {
> > > -		object = (void *)(unsigned long)argv->v0.token;
> > > -		argv->v0.route = object->route;
> > > -		argv->v0.token = object->token;
> > > -		if (ret == 0 && argv->v0.type == NVIF_IOCTL_V0_DEL) {
> > > -			list_del(&object->head);
> > > -			kfree(object);
> > > -		}
> > > -	} else {
> > > -		argv->v0.route = NVIF_IOCTL_V0_ROUTE_HIDDEN;
> > > -		argv->v0.token = 0;
> > > -	}
> > > -	argv->v0.owner = owner;
> > > -	mutex_unlock(&cli->mutex);
> > > -
> > > -	if (copy_to_user(user, argv, argc))
> > > -		ret = -EFAULT;
> > > -done:
> > > -	kfree(argv);
> > > -	return ret;
> > > -}
> > > -
> > > -void
> > > -usif_client_fini(struct nouveau_cli *cli)
> > > -{
> > > -	struct usif_object *object, *otemp;
> > > -
> > > -	list_for_each_entry_safe(object, otemp, &cli->objects, head) {
> > > -		usif_object_dtor(object);
> > > -	}
> > > -}
> > > -
> > > -void
> > > -usif_client_init(struct nouveau_cli *cli)
> > > -{
> > > -	INIT_LIST_HEAD(&cli->objects);
> > > -}
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.h b/drivers/gpu/drm/nouveau/nouveau_usif.h
> > > deleted file mode 100644
> > > index dc90d4a9d0d9..000000000000
> > > --- a/drivers/gpu/drm/nouveau/nouveau_usif.h
> > > +++ /dev/null
> > > @@ -1,10 +0,0 @@
> > > -/* SPDX-License-Identifier: MIT */
> > > -#ifndef __NOUVEAU_USIF_H__
> > > -#define __NOUVEAU_USIF_H__
> > > -
> > > -void usif_client_init(struct nouveau_cli *);
> > > -void usif_client_fini(struct nouveau_cli *);
> > > -int  usif_ioctl(struct drm_file *, void __user *, u32);
> > > -int  usif_notify(const void *, u32, const void *, u32);
> > > -
> > > -#endif
> > > -- 
> > > 2.45.1
> > > 
> 

