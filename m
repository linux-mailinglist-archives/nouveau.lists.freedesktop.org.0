Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5AF9377EC
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 14:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4BB10E0BF;
	Fri, 19 Jul 2024 12:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jGbghN6H";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F269010E0BF
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721393266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqoVI7zZ5lnr0RFanh5b7eLwMr/Ta93h/coIdxvCewA=;
 b=jGbghN6HzrZ8y5egyM5EJGqO+9XYawxHoz5Bnibk/+sRZfyZG6VjhHBngXUu17t4x4UoL5
 uHA1JFIIxTeXZHBrk1Vo/5I4yNXg6jXH1Y+mPnl74EIi+5tgm1IBFLoIHZlbuqqIL0KZmY
 DmPn52bMrTVhYOv2JwqoMJD0x+RJHi8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-4wugYAC0MOCmLRaRDUQj5w-1; Fri, 19 Jul 2024 08:47:41 -0400
X-MC-Unique: 4wugYAC0MOCmLRaRDUQj5w-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4265d3bf59dso11699345e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 05:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721393260; x=1721998060;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eqoVI7zZ5lnr0RFanh5b7eLwMr/Ta93h/coIdxvCewA=;
 b=IjU6fj/SEoSJRK4PRNPhM2HgBrSOFdvFDeZUhBKHpQJ6GumprNTcTSpsM1/bv4qasz
 /8ueEtGA/ji8IC5syAoZKFlEVAO7E1jqZSOL5roZydTqgQpEs7cgLwze9r21tWAoiVc2
 7fFdYLlg9kF0qnIVShaOGKGCT57cn5wLmQXehjJIlAI+DB6jOnp3Oc7RCknU8EncVO6n
 o664W9mRngTXD3OkgsPFfohgJG9ZHMxKnISObdzq9hLkz9VZPMlf1nMfw42fziZzg3Yy
 pBqSzXSwmLh7n4wp1EY13sQmEveCQ3UYCIm/O6Z/7CteMZLw1ELxwiacaSXuVjfSkxtu
 LGKQ==
X-Gm-Message-State: AOJu0YwAzFJmElNQi9nXQSOE0v/08+7csSWhB1s/Ud9vbQm5gjYXB4Tz
 L9XvxE/urA58V8/ZUkbLsEVKCG9JnAusMSEfKkFhoiwvhj1bf3bEru0XQFy83V7UPQkxluNvQ1H
 O8yFDrfks+x1qNW/Nqucz9Jy4N216Tsht2jDvyrUwoyv5DsNrdmoTY2MssKiDWDE=
X-Received: by 2002:a05:600c:524f:b0:426:6675:a115 with SMTP id
 5b1f17b1804b1-427c2cb547emr52807835e9.22.1721393260382; 
 Fri, 19 Jul 2024 05:47:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlj9O6Z71xnmiYFzqe1uWelkxZCAbtFNyKvfVSUrD7Dxs+4OQPmanqVYxf/E3UrrkMQjbIOA==
X-Received: by 2002:a05:600c:524f:b0:426:6675:a115 with SMTP id
 5b1f17b1804b1-427c2cb547emr52807725e9.22.1721393259898; 
 Fri, 19 Jul 2024 05:47:39 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a7218esm48613485e9.25.2024.07.19.05.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 05:47:39 -0700 (PDT)
Date: Fri, 19 Jul 2024 14:47:37 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 28/37] drm/nouveau: add nvif_mmu to nouveau_drm
Message-ID: <Zppgacvfp9PceTPG@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-29-bskeggs@nvidia.com>
 <Zo1msLvf2Vfz90Mb@pollux>
 <d3093056-0cb2-438c-a5a2-de7b064e33fc@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d3093056-0cb2-438c-a5a2-de7b064e33fc@nvidia.com>
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

On Thu, Jul 18, 2024 at 06:10:29PM +1000, Ben Skeggs wrote:
> On 10/7/24 02:34, Danilo Krummrich wrote:
> 
> > On Fri, Jul 05, 2024 at 04:37:12AM +1000, Ben Skeggs wrote:
> > > This allocates a new nvif_mmu in nouveau_drm, and uses it for TTM
> > > backend memory allocations instead of nouveau_drm.master.mmu,
> > > which will be removed in a later commit.
> > It would be good to make clear that this is part of a couple of commits that aim
> > at removing nouveau_drm::master.
> 
> Nearly the entire series relates to that in some manner. Nevertheless, I've
> slightly reworded the commit message.

I think there are quite some unrelated ones. Otherwise I wonder why this series
is titled "misc. cleanups and removal of unused apis" and the cover letter does
not mention the removal of nouveau_drm::master at all.

Anyway, next time it would probably be good to partition things even more.
For instance, have one series that only does the nouveau_drm::master removal and
another one that only does the other misc cleanups.

> 
> > 
> > Also, can we get all related commits a bit closer to each other?
> 
> They basically are.  Only a handful of commits could likely be moved around
> safely, and not in any way that'd result in any kind of perfect ordering
> like you're asking for.  It also invalidates the testing I've done to ensure
> things are bisectable.

It's not about perfect ordering, it's about making it easier to review and hence
make the process less error prone. It's also less annoying for the author; when
things are obvious, reviewers tend to ask less stupid questions. :)

> 
> > 
> > > Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c | 35 ++++++++++++++++-----------
> > >   drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
> > >   drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
> > >   3 files changed, 28 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > index 5ff116bcbabf..07748cfab233 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > @@ -227,13 +227,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
> > >   		{}
> > >   	};
> > >   	static const struct nvif_mclass
> > > -	mmus[] = {
> > > -		{ NVIF_CLASS_MMU_GF100, -1 },
> > > -		{ NVIF_CLASS_MMU_NV50 , -1 },
> > > -		{ NVIF_CLASS_MMU_NV04 , -1 },
> > > -		{}
> > > -	};
> > > -	static const struct nvif_mclass
> > >   	vmms[] = {
> > >   		{ NVIF_CLASS_VMM_GP100, -1 },
> > >   		{ NVIF_CLASS_VMM_GM200, -1 },
> > > @@ -270,13 +263,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
> > >   	cli->device.object.map.ptr = drm->device.object.map.ptr;
> > > -	ret = nvif_mclass(&cli->device.object, mmus);
> > > -	if (ret < 0) {
> > > -		NV_PRINTK(err, cli, "No supported MMU class\n");
> > > -		goto done;
> > > -	}
> > > -
> > > -	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", mmus[ret].oclass,
> > > +	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", drm->mmu.object.oclass,
> > >   			    &cli->mmu);
> > >   	if (ret) {
> > >   		NV_PRINTK(err, cli, "MMU allocation failed: %d\n", ret);
> > > @@ -717,6 +704,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
> > >   	if (drm->dev)
> > >   		drm_dev_put(drm->dev);
> > > +	nvif_mmu_dtor(&drm->mmu);
> > >   	nvif_device_dtor(&drm->device);
> > >   	nvif_client_dtor(&drm->master.base);
> > >   	nvif_parent_dtor(&drm->parent);
> > > @@ -728,6 +716,13 @@ static struct nouveau_drm *
> > >   nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
> > >   		       struct nvkm_device *device)
> > >   {
> > > +	static const struct nvif_mclass
> > > +	mmus[] = {
> > > +		{ NVIF_CLASS_MMU_GF100, -1 },
> > > +		{ NVIF_CLASS_MMU_NV50 , -1 },
> > > +		{ NVIF_CLASS_MMU_NV04 , -1 },
> > > +		{}
> > > +	};
> > >   	struct nouveau_drm *drm;
> > >   	int ret;
> > > @@ -757,6 +752,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
> > >   		goto done;
> > >   	}
> > > +	ret = nvif_mclass(&drm->device.object, mmus);
> > > +	if (ret < 0) {
> > > +		NV_ERROR(drm, "No supported MMU class\n");
> > > +		goto done;
> > > +	}
> > > +
> > > +	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
> > > +	if (ret) {
> > > +		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
> > > +		goto done;
> > > +	}
> > > +
> > >   	drm->dev = drm_dev_alloc(drm_driver, parent);
> > >   	if (IS_ERR(drm->dev)) {
> > >   		ret = PTR_ERR(drm->dev);
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > index a9e0a63c772e..2535a50b99f3 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > > @@ -204,6 +204,7 @@ struct nouveau_drm {
> > >   	struct nvkm_device *nvkm;
> > >   	struct nvif_parent parent;
> > >   	struct nvif_device device;
> > > +	struct nvif_mmu mmu;
> > >   	struct nouveau_cli master;
> > >   	struct nouveau_cli client;
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> > > index 25f31d5169e5..67f93cf753ba 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> > > @@ -91,7 +91,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
> > >   	struct nouveau_mem *mem = nouveau_mem(reg);
> > >   	struct nouveau_cli *cli = mem->cli;
> > >   	struct nouveau_drm *drm = cli->drm;
> > > -	struct nvif_mmu *mmu = &cli->mmu;
> > > +	struct nvif_mmu *mmu = &drm->mmu;
> > >   	struct nvif_mem_ram_v0 args = {};
> > >   	u8 type;
> > >   	int ret;
> > > @@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
> > >   		args.dma = tt->dma_address;
> > >   	mutex_lock(&drm->master.lock);
> > > -	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
> > > +	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
> > >   				 reg->size,
> > >   				 &args, sizeof(args), &mem->mem);
> > >   	mutex_unlock(&drm->master.lock);
> > > @@ -128,14 +128,14 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
> > >   	struct nouveau_mem *mem = nouveau_mem(reg);
> > >   	struct nouveau_cli *cli = mem->cli;
> > >   	struct nouveau_drm *drm = cli->drm;
> > > -	struct nvif_mmu *mmu = &cli->mmu;
> > > +	struct nvif_mmu *mmu = &drm->mmu;
> > >   	u64 size = ALIGN(reg->size, 1 << page);
> > >   	int ret;
> > >   	mutex_lock(&drm->master.lock);
> > > -	switch (cli->mem->oclass) {
> > > +	switch (mmu->mem) {
> > >   	case NVIF_CLASS_MEM_GF100:
> > > -		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
> > > +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
> > >   					 drm->ttm.type_vram, page, size,
> > >   					 &(struct gf100_mem_v0) {
> > >   						.contig = contig,
> > > @@ -143,7 +143,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
> > >   					 &mem->mem);
> > >   		break;
> > >   	case NVIF_CLASS_MEM_NV50:
> > > -		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
> > > +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
> > >   					 drm->ttm.type_vram, page, size,
> > >   					 &(struct nv50_mem_v0) {
> > >   						.bankswz = mmu->kind[mem->kind] == 2,
> > > -- 
> > > 2.45.1
> > > 
> 

