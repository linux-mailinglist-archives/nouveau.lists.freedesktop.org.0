Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9493779F
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 14:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F8910EBFE;
	Fri, 19 Jul 2024 12:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T1xMNSml";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EE810EBFE
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721391168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixAExVKRdmWVBov0vFHIgy1lZ3fzzTrw3UCsqNXVNxA=;
 b=T1xMNSmlCy1cTQapd0FZwCFrXfBz20vQRyhfGmpZGffSpDPRhskFGxNFP1Rr0wBwXuGM/W
 cbaCk/ZmGAnToHWZXLB1V/jnw4Ko9arsHIrpxGw2Bru1T0GclhTjR6rehKZw2OTHT1zoJ2
 axEuHhSwxNpow8zA+Zx4h9Dq6Ns5rw8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-h7TxB-JpPXmZFah9D0GO0g-1; Fri, 19 Jul 2024 08:12:46 -0400
X-MC-Unique: h7TxB-JpPXmZFah9D0GO0g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42726545762so10484065e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 05:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721391165; x=1721995965;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ixAExVKRdmWVBov0vFHIgy1lZ3fzzTrw3UCsqNXVNxA=;
 b=LfkDn9TZSBhshN+s62UaHUOqFypXllHeIjtNtvUxLqxGtu9JnKi8Jtt6/rZk8ua0fg
 jf1aS8Yyr+zqdOHXHmY2r16RSjJOIpGmlDa3P2dmnkoQKxSxBwAEwz05Ov9AnUA4y2b3
 XK3ApTRFGY+DSlMNwfwSn/FbipkfX1q0gsG5jibqgEOR/lhT3ZTNAmU0X/nUdLQffsu/
 0ClqayquBTjkmchfPg+mUUCZ/W+32e4GrpWOvP83jRpkEj9za0rQEVd9AI+tCqY112tv
 RduZ9sqwuqI1sS5aIOfPkeiWS3CF+PEIkCSFj/bD5rcBcBiA1dBHLFqTiAFOX9rxhtPH
 m65Q==
X-Gm-Message-State: AOJu0YxQ/akxU6MWpcQmFsQj91aKQ+nHvGv5mbKnDM69FV49ptng3JeM
 57DUe6IO8a/bgcrpUTEfJM4ASj3yl9shYV+rBx+01pclwNiY9Psr+axwSn69ejOnr+TfO4Bz6Du
 7YA4yJfML7PI6XiyEukJhTa5nA2e7uAUC3bebuZgr6nbZ3yj7ArOs2X1H66NeBUs=
X-Received: by 2002:a5d:5441:0:b0:368:37d5:3f2e with SMTP id
 ffacd0b85a97d-36837d53fdcmr4509119f8f.32.1721391165341; 
 Fri, 19 Jul 2024 05:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFATcwyX9W83TLMvIavjX2eS7PzVI06cAhHQ/3M7KXcBAaSPgMPmwlkzowewQsg8hmvfYQTZg==
X-Received: by 2002:a5d:5441:0:b0:368:37d5:3f2e with SMTP id
 ffacd0b85a97d-36837d53fdcmr4509100f8f.32.1721391164787; 
 Fri, 19 Jul 2024 05:12:44 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8d8a8sm50753975e9.36.2024.07.19.05.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 05:12:44 -0700 (PDT)
Date: Fri, 19 Jul 2024 14:12:42 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 15/37] drm/nouveau/nvif: remove route/token
Message-ID: <ZppYOmWfup8lwC3L@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-16-bskeggs@nvidia.com>
 <Zo1hKGEajZJLzeAy@pollux>
 <839e9000-aa4e-4879-aa0d-6c17fd19699c@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <839e9000-aa4e-4879-aa0d-6c17fd19699c@nvidia.com>
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

On Thu, Jul 18, 2024 at 05:52:44PM +1000, Ben Skeggs wrote:
> On 10/7/24 02:11, Danilo Krummrich wrote:
> 
> > On Fri, Jul 05, 2024 at 04:36:59AM +1000, Ben Skeggs wrote:
> > > These were a cludge used to prevent userspace's nvif ioctl from
> > > accessing objects created by the kernel for the same client.
> > > 
> > > That interface was removed in a previous patch, so these are no
> > > longer useful for anything.
> > It would probably be good to move this patch directly after the one it depends
> > on.
> 
> Is this really necessary?  The ordering of this series is already incredibly
> fragile, with a bunch of chicken/egg situations that were tough to
> untangle.  Moreover, I don't see what real value it adds at this point.

Not for this series, but in general. If such large series are required, having
directly related ones close to each other, makes it way easier to review.

> 
> > 
> > > Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/include/nvif/client.h |  1 -
> > >   .../drm/nouveau/include/nvkm/core/object.h    |  2 --
> > >   .../drm/nouveau/include/nvkm/core/oclass.h    |  2 --
> > >   drivers/gpu/drm/nouveau/nouveau_abi16.c       |  8 --------
> > >   drivers/gpu/drm/nouveau/nvif/client.c         |  1 -
> > >   drivers/gpu/drm/nouveau/nvif/object.c         |  3 ---
> > >   drivers/gpu/drm/nouveau/nvkm/core/client.c    |  2 --
> > >   drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 19 ++++---------------
> > >   drivers/gpu/drm/nouveau/nvkm/core/object.c    |  2 --
> > >   drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |  4 ++--
> > >   10 files changed, 6 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
> > > index 5d9395e651b6..64b033222c56 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvif/client.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
> > > @@ -8,7 +8,6 @@ struct nvif_client {
> > >   	struct nvif_object object;
> > >   	const struct nvif_driver *driver;
> > >   	u64 version;
> > > -	u8 route;
> > >   };
> > >   int  nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
> > > index ed1f66360782..d4f1c964ba31 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
> > > @@ -15,8 +15,6 @@ struct nvkm_object {
> > >   	struct list_head head;
> > >   	struct list_head tree;
> > > -	u8  route;
> > > -	u64 token;
> > >   	u64 object;
> > >   	struct rb_node node;
> > >   };
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h b/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
> > > index 8e1b945d38f3..cad05f0e7948 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
> > > @@ -21,8 +21,6 @@ struct nvkm_oclass {
> > >   	const void *priv;
> > >   	const void *engn;
> > >   	u32 handle;
> > > -	u8  route;
> > > -	u64 token;
> > >   	u64 object;
> > >   	struct nvkm_client *client;
> > >   	struct nvkm_object *parent;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > index 6f0548e57f9e..704977530b6b 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > > @@ -521,7 +521,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
> > >   	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
> > >   	struct nouveau_abi16_chan *chan;
> > >   	struct nouveau_abi16_ntfy *ntfy;
> > > -	struct nvif_client *client;
> > >   	struct nvif_sclass *sclass;
> > >   	s32 oclass = 0;
> > >   	int ret, i;
> > > @@ -531,7 +530,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
> > >   	if (init->handle == ~0)
> > >   		return nouveau_abi16_put(abi16, -EINVAL);
> > > -	client = &abi16->cli->base;
> > >   	chan = nouveau_abi16_chan(abi16, init->channel);
> > >   	if (!chan)
> > > @@ -596,10 +594,8 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
> > >   	list_add(&ntfy->head, &chan->notifiers);
> > > -	client->route = NVDRM_OBJECT_ABI16;
> > >   	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", init->handle,
> > >   			       oclass, NULL, 0, &ntfy->object);
> > > -	client->route = NVDRM_OBJECT_NVIF;
> > >   	if (ret)
> > >   		nouveau_abi16_ntfy_fini(chan, ntfy);
> > > @@ -615,7 +611,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
> > >   	struct nouveau_abi16_chan *chan;
> > >   	struct nouveau_abi16_ntfy *ntfy;
> > >   	struct nvif_device *device;
> > > -	struct nvif_client *client;
> > >   	struct nv_dma_v0 args = {};
> > >   	int ret;
> > > @@ -626,7 +621,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
> > >   	/* completely unnecessary for these chipsets... */
> > >   	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
> > >   		return nouveau_abi16_put(abi16, -EINVAL);
> > > -	client = &abi16->cli->base;
> > >   	chan = nouveau_abi16_chan(abi16, info->channel);
> > >   	if (!chan)
> > > @@ -663,11 +657,9 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
> > >   		args.limit += chan->ntfy->offset;
> > >   	}
> > > -	client->route = NVDRM_OBJECT_ABI16;
> > >   	ret = nvif_object_ctor(&chan->chan->user, "abi16Ntfy", info->handle,
> > >   			       NV_DMA_IN_MEMORY, &args, sizeof(args),
> > >   			       &ntfy->object);
> > > -	client->route = NVDRM_OBJECT_NVIF;
> > >   	if (ret)
> > >   		goto done;
> > > diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
> > > index 3a27245f467f..cd5439b73ac7 100644
> > > --- a/drivers/gpu/drm/nouveau/nvif/client.c
> > > +++ b/drivers/gpu/drm/nouveau/nvif/client.c
> > > @@ -79,7 +79,6 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
> > >   	client->object.client = client;
> > >   	client->object.handle = ~0;
> > > -	client->route = NVIF_IOCTL_V0_ROUTE_NVIF;
> > >   	client->driver = parent->driver;
> > >   	if (ret == 0) {
> > > diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> > > index 4d1aaee8fe15..2b3e05197846 100644
> > > --- a/drivers/gpu/drm/nouveau/nvif/object.c
> > > +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> > > @@ -40,7 +40,6 @@ nvif_object_ioctl(struct nvif_object *object, void *data, u32 size, void **hack)
> > >   			args->v0.object = nvif_handle(object);
> > >   		else
> > >   			args->v0.object = 0;
> > > -		args->v0.owner = NVIF_IOCTL_V0_OWNER_ANY;
> > >   	} else
> > >   		return -ENOSYS;
> > > @@ -286,8 +285,6 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
> > >   		args->ioctl.version = 0;
> > >   		args->ioctl.type = NVIF_IOCTL_V0_NEW;
> > >   		args->new.version = 0;
> > > -		args->new.route = parent->client->route;
> > > -		args->new.token = nvif_handle(object);
> > >   		args->new.object = nvif_handle(object);
> > >   		args->new.handle = handle;
> > >   		args->new.oclass = oclass;
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
> > > index 48416c5039a1..95cbb5b682f2 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
> > > @@ -51,8 +51,6 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
> > >   	client->object.client = oclass->client;
> > >   	client->object.handle = oclass->handle;
> > > -	client->object.route  = oclass->route;
> > > -	client->object.token  = oclass->token;
> > >   	client->object.object = oclass->object;
> > >   	client->debug = oclass->client->debug;
> > >   	*pobject = &client->object;
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > index 0b33287e43a7..39d5c9700867 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> > > @@ -112,10 +112,9 @@ nvkm_ioctl_new(struct nvkm_client *client,
> > >   	nvif_ioctl(parent, "new size %d\n", size);
> > >   	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
> > > -		nvif_ioctl(parent, "new vers %d handle %08x class %08x "
> > > -				   "route %02x token %llx object %016llx\n",
> > > +		nvif_ioctl(parent, "new vers %d handle %08x class %08x object %016llx\n",
> > >   			   args->v0.version, args->v0.handle, args->v0.oclass,
> > > -			   args->v0.route, args->v0.token, args->v0.object);
> > > +			   args->v0.object);
> > >   	} else
> > >   		return ret;
> > > @@ -127,8 +126,6 @@ nvkm_ioctl_new(struct nvkm_client *client,
> > >   	do {
> > >   		memset(&oclass, 0x00, sizeof(oclass));
> > >   		oclass.handle = args->v0.handle;
> > > -		oclass.route  = args->v0.route;
> > > -		oclass.token  = args->v0.token;
> > >   		oclass.object = args->v0.object;
> > >   		oclass.client = client;
> > >   		oclass.parent = parent;
> > > @@ -331,7 +328,7 @@ nvkm_ioctl_v0[] = {
> > >   static int
> > >   nvkm_ioctl_path(struct nvkm_client *client, u64 handle, u32 type,
> > > -		void *data, u32 size, u8 owner, u8 *route, u64 *token)
> > > +		void *data, u32 size)
> > >   {
> > >   	struct nvkm_object *object;
> > >   	int ret;
> > > @@ -342,13 +339,6 @@ nvkm_ioctl_path(struct nvkm_client *client, u64 handle, u32 type,
> > >   		return PTR_ERR(object);
> > >   	}
> > > -	if (owner != NVIF_IOCTL_V0_OWNER_ANY && owner != object->route) {
> > > -		nvif_ioctl(&client->object, "route != owner\n");
> > > -		return -EACCES;
> > > -	}
> > > -	*route = object->route;
> > > -	*token = object->token;
> > > -
> > >   	if (ret = -EINVAL, type < ARRAY_SIZE(nvkm_ioctl_v0)) {
> > >   		if (nvkm_ioctl_v0[type].version == 0)
> > >   			ret = nvkm_ioctl_v0[type].func(client, object, data, size);
> > > @@ -374,8 +364,7 @@ nvkm_ioctl(struct nvkm_client *client, void *data, u32 size, void **hack)
> > >   			   args->v0.version, args->v0.type, args->v0.object,
> > >   			   args->v0.owner);
> > >   		ret = nvkm_ioctl_path(client, args->v0.object, args->v0.type,
> > > -				      data, size, args->v0.owner,
> > > -				      &args->v0.route, &args->v0.token);
> > > +				      data, size);
> > >   	}
> > >   	if (ret != 1) {
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
> > > index aea3ba72027a..580b8c7f25af 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
> > > @@ -313,8 +313,6 @@ nvkm_object_ctor(const struct nvkm_object_func *func,
> > >   	object->engine = nvkm_engine_ref(oclass->engine);
> > >   	object->oclass = oclass->base.oclass;
> > >   	object->handle = oclass->handle;
> > > -	object->route  = oclass->route;
> > > -	object->token  = oclass->token;
> > >   	object->object = oclass->object;
> > >   	INIT_LIST_HEAD(&object->head);
> > >   	INIT_LIST_HEAD(&object->tree);
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
> > > index ba9d9edaec75..cc254c390a57 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
> > > @@ -116,9 +116,9 @@ nvkm_uevent_ntfy(struct nvkm_event_ntfy *ntfy, u32 bits)
> > >   	struct nvkm_client *client = uevent->object.client;
> > >   	if (uevent->func)
> > > -		return uevent->func(uevent->parent, uevent->object.token, bits);
> > > +		return uevent->func(uevent->parent, uevent->object.object, bits);
> > > -	return client->event(uevent->object.token, NULL, 0);
> > > +	return client->event(uevent->object.object, NULL, 0);
> > >   }
> > >   int
> > > -- 
> > > 2.45.1
> > > 
> 

