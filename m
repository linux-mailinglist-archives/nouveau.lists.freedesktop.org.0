Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45867E4BB
	for <lists+nouveau@lfdr.de>; Fri, 27 Jan 2023 13:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BC010E461;
	Fri, 27 Jan 2023 12:10:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4081D10E030;
 Fri, 27 Jan 2023 12:10:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E08FA21EB7;
 Fri, 27 Jan 2023 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674821446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07dh0oC/UdpdjtV1PDerdEYISe/VcXNWak+RtCBFcVk=;
 b=YWtoY4r82xjQIkDkuu9HeSHMRO1mJUpU4eBER3Z7+yOTbnyz0sjSO9p+H3rVc2b526Yj91
 4Hy2oDt+77lGsoyim/NQYL7t7r3IeLpU+cBj0TS0ktKCrGJ+Xl77AXlNtSsR7HP/5wpZJL
 h/W4qbfdmaX7YgSQlCBMPUbVIzYijSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674821446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07dh0oC/UdpdjtV1PDerdEYISe/VcXNWak+RtCBFcVk=;
 b=tAYdBaRX0I8uD9dmnyzrWvLDhS0nU+RVc/ldfTsdKG5hUNygGH9/JlUjiMMQuXCissE7fA
 82ix3mnEyIug8yAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B257D138E3;
 Fri, 27 Jan 2023 12:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yru+Kka/02MCdwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 27 Jan 2023 12:10:46 +0000
Date: Fri, 27 Jan 2023 13:10:46 +0100
Message-ID: <87mt64qit5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: bskeggs@redhat.com
In-Reply-To: <87mt6zr9s4.wl-tiwai@suse.de>
References: <20221230072758.443644-1-zyytlz.wz@163.com>
 <87mt6zr9s4.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
 linux-kernel@vger.kernel.org, Zheng Wang <zyytlz.wz@163.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 03 Jan 2023 15:07:55 +0100,
Takashi Iwai wrote:
> 
> On Fri, 30 Dec 2022 08:27:58 +0100,
> Zheng Wang wrote:
> > 
> > Here is a function call chain.
> > nvkm_vmm_pfn_map->nvkm_vmm_pfn_split_merge->nvkm_vmm_node_split
> > If nvkm_vma_tail return NULL in nvkm_vmm_node_split, it will
> > finally invoke nvkm_vmm_node_merge->nvkm_vmm_node_delete, which
> > will free the vma. However, nvkm_vmm_pfn_map didn't notice that.
> > It goes into next label and UAF happens.
> > 
> > Fix it by returning the return-value of nvkm_vmm_node_merge
> > instead of NULL.
> > 
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> 
> FWIW, CVE-2023-0030 has been assigned to this bug.
> It's a question whether it really deserves as a security issue, but a
> bug is a bug...
> 
> Ben, could you review this please?

A gentle ping as reminder.  The bug is still present.


thanks,

Takashi

> 
> 
> thanks,
> 
> Takashi
> 
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > index ae793f400ba1..84d6fc87b2e8 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> > @@ -937,8 +937,8 @@ nvkm_vmm_node_split(struct nvkm_vmm *vmm,
> >  	if (vma->size != size) {
> >  		struct nvkm_vma *tmp;
> >  		if (!(tmp = nvkm_vma_tail(vma, vma->size - size))) {
> > -			nvkm_vmm_node_merge(vmm, prev, vma, NULL, vma->size);
> > -			return NULL;
> > +			tmp = nvkm_vmm_node_merge(vmm, prev, vma, NULL, vma->size);
> > +			return tmp;
> >  		}
> >  		tmp->part = true;
> >  		nvkm_vmm_node_insert(vmm, tmp);
> > -- 
> > 2.25.1
> > 
