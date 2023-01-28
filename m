Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D62467F3EE
	for <lists+nouveau@lfdr.de>; Sat, 28 Jan 2023 03:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E30210E2ED;
	Sat, 28 Jan 2023 02:17:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3862B10E2ED
 for <nouveau@lists.freedesktop.org>; Sat, 28 Jan 2023 02:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674872246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Nfb5TyV36RNZzOexJAnbr/uhWI9BYbLm6GvCjHYzrI=;
 b=XWdT1s43ktZCqtnYqBBSYptnHM29H5QYUzom+i3avAbVwLSdm5oIfpGP7VbW8F/XpHAc9O
 55OiSZw/HuHTcUsYx+zi9xjWgSiR30ZSXG49OD9FNhO2QLxf9as8Vg0tKIuhA0nFy5w/hP
 ED8wf3OA5LrE4NToRY4kz8bG2S9oO1g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-347-NFj7on3vOeWNSEhfchU_8Q-1; Fri, 27 Jan 2023 21:17:24 -0500
X-MC-Unique: NFj7on3vOeWNSEhfchU_8Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc9-20020a1709078a0900b0086910fdf624so4449394ejc.13
 for <nouveau@lists.freedesktop.org>; Fri, 27 Jan 2023 18:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Nfb5TyV36RNZzOexJAnbr/uhWI9BYbLm6GvCjHYzrI=;
 b=U4CZgbWuenyT5A24dvO+uDaCM2x/G+P29w5czPM2Sox7+x5yEJ0NZcarQIRUUgh3tM
 X1AwQbiixf4pUaDk7a0Q/k9JtxgbS+3j371DrKr5DvDvX+7F2rTbSWlT6QJyAu7vNJzp
 GLCCekaW6XhRcOuBYMhV4M1NLmsNMGzIJUr7SHzephr9DbF7lv8lR+cFSsgstvJaqYaY
 ZqLdCy5kHJVVd2Mg+c5DF9rbq5sB6eYq9PkcNECakIUqm6LxpnfXziVZc1ug8OLZIXVC
 z5+chNBPRMS/26bm9lt03OTHTYvaHQlzHwnXPvOoKArRqS1h79mFBItKCu+5Jqhb0/aT
 V7yw==
X-Gm-Message-State: AFqh2koGStBVXxHwTyTMeYKTBo8A0iMMUsjudzdPpjj50psflvo7kp8N
 CjBN2o8fxDZ7ex9BGjKbgWGnpiLrp9gUJMzBshvpU8Vf2onoq3TOsL5NNYX9Nkk8eX+cjt1DSai
 bvFGgYeWji2619WQZxITxykYh6g==
X-Received: by 2002:a17:907:d684:b0:870:4986:2ce with SMTP id
 wf4-20020a170907d68400b00870498602cemr51588156ejc.58.1674872243766; 
 Fri, 27 Jan 2023 18:17:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXum01YGNXBgtWBiKpPeFfGkYkT0P2LOkTiVNvtA7VlleM4KOwoApiJmgjZunuCwGbsvP8dFdQ==
X-Received: by 2002:a17:907:d684:b0:870:4986:2ce with SMTP id
 wf4-20020a170907d68400b00870498602cemr51588140ejc.58.1674872243534; 
 Fri, 27 Jan 2023 18:17:23 -0800 (PST)
Received: from WINDOWS. ([2a02:810d:4b3f:de78:34ca:d547:b407:3c1c])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a170906065500b007a4e02e32ffsm3202905ejb.60.2023.01.27.18.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 18:17:22 -0800 (PST)
Message-ID: <63d485b2.170a0220.4af4c.d54f@mx.google.com>
X-Google-Original-Message-ID: <Y9SFqwE50SA4NwMZ@WINDOWS.>
Date: Sat, 28 Jan 2023 03:17:15 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20221230072758.443644-1-zyytlz.wz@163.com>
 <87mt6zr9s4.wl-tiwai@suse.de> <87mt64qit5.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <87mt64qit5.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: fix Use after Free bug in
 nvkm_vmm_node_split
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
Cc: alex000young@gmail.com, security@kernel.org, nouveau@lists.freedesktop.org,
 hackerzheng666@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bskeggs@redhat.com,
 Zheng Wang <zyytlz.wz@163.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 01:10:46PM +0100, Takashi Iwai wrote:
> On Tue, 03 Jan 2023 15:07:55 +0100,
> Takashi Iwai wrote:
> > 
> > On Fri, 30 Dec 2022 08:27:58 +0100,
> > Zheng Wang wrote:
> > > 
> > > Here is a function call chain.
> > > nvkm_vmm_pfn_map->nvkm_vmm_pfn_split_merge->nvkm_vmm_node_split
> > > If nvkm_vma_tail return NULL in nvkm_vmm_node_split, it will
> > > finally invoke nvkm_vmm_node_merge->nvkm_vmm_node_delete, which
> > > will free the vma. However, nvkm_vmm_pfn_map didn't notice that.
> > > It goes into next label and UAF happens.
> > > 
> > > Fix it by returning the return-value of nvkm_vmm_node_merge
> > > instead of NULL.
> > > 
> > > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > 
> > FWIW, CVE-2023-0030 has been assigned to this bug.
> > It's a question whether it really deserves as a security issue, but a
> > bug is a bug...
> > 
> > Ben, could you review this please?
> 
> A gentle ping as reminder.  The bug is still present.

This was also reported in [1]. I had a closer look and FWICT this code is fine
and there isn't a bug.

Zheng Wang, the reporter of the BZ, also confirmed this to be a false positive
from CodeQL.

Anyway, here's the explaination I also posted in the BZ:

"In nvkm_vmm_node_merge() nvkm_vmm_node_delete() is only called when prev is
set. However, prev is NULL unless we enter the "if (vma->addr != addr)" path in
nvkm_vmm_node_split(). In such a case the vma pointer, which is also passed to
nvkm_vmm_node_merge(), is set to a freshly allocated struct nvkm_vma with
nvkm_vma_tail() right before prev is set to the old vma pointer.

Hence, the only thing happening there when nvkm_vma_tail() fails in the
"if (vma->size != size)" path is that either nvkm_vmm_node_merge() does nothing
in case prev wasn't set or it merges and frees the new vma created in the
"if (vma->addr != addr)" path. Or in other words the proper cleanup for the
error condition is done.

I can't see any case where the original vma pointer given by nvkm_vmm_pfn_map()
is actually freed."

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2157041

- Danilo

> 
> 
> thanks,
> 
> Takashi
> 
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > > index ae793f400ba1..84d6fc87b2e8 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > > @@ -937,8 +937,8 @@ nvkm_vmm_node_split(struct nvkm_vmm *vmm,
> > >  	if (vma->size != size) {
> > >  		struct nvkm_vma *tmp;
> > >  		if (!(tmp = nvkm_vma_tail(vma, vma->size - size))) {
> > > -			nvkm_vmm_node_merge(vmm, prev, vma, NULL, vma->size);
> > > -			return NULL;
> > > +			tmp = nvkm_vmm_node_merge(vmm, prev, vma, NULL, vma->size);
> > > +			return tmp;
> > >  		}
> > >  		tmp->part = true;
> > >  		nvkm_vmm_node_insert(vmm, tmp);
> > > -- 
> > > 2.25.1
> > > 
> 

