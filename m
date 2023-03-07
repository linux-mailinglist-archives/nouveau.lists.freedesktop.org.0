Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC296AD330
	for <lists+nouveau@lfdr.de>; Tue,  7 Mar 2023 01:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165F710E271;
	Tue,  7 Mar 2023 00:11:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE4B10E271
 for <nouveau@lists.freedesktop.org>; Tue,  7 Mar 2023 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678147885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFSOAGCFBzs2Dfwy4LmBFaGQi1+dg8AS24/ZjCcSYZs=;
 b=N8dN8RM3vXP8P05x9eDzxUgsnDLLMd+IzMT/Zp7lgetzHEENJLI+6l4HjduA3WzSYufZdT
 50CLd78jHrB3U6TTA6PJsSKaP9MotRDBdWj66uRKgKzDW8MpXWEFFsyP/5qV6Ps/dzwbLb
 ABawDA7avt0GpGe0c3IefA3EE+6gNiQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-p06WAADTOrO0NpjaOblZLA-1; Mon, 06 Mar 2023 19:11:21 -0500
X-MC-Unique: p06WAADTOrO0NpjaOblZLA-1
Received: by mail-qk1-f200.google.com with SMTP id
 ou5-20020a05620a620500b007423e532628so6416132qkn.5
 for <nouveau@lists.freedesktop.org>; Mon, 06 Mar 2023 16:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147881;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fOzDuJrDxV1m0d9OGwSp4ESW3MVpzmUb4ORlvJ2wcQA=;
 b=wmjyjDIyiQ3wbdcWDMhC7z88UhgUA98a0BGJz+DLffo32DbbkrwFjTG4/CFqJdMY54
 2Q7qbV6SXYnso/z0gBgYJY1jPMMwp8PIsdSchRbvoWVI9h2Cz4GsEQ0hZZhSMa1DnqHL
 g6WtjtamJtdTaSKu3r+KXANc5jZGs+uxkW7r6v0nB+rPPPdddygN7ak4qHcNyMSEgo7c
 SUjQQgZ8LCSPXfbGpvFevjG2QiTM+26wdevW3MxDM4VWEpL15q6KmLg499Jwa7onfpyd
 tKenSon0huwfJqyDQin/rC+OLwPiRifAD8GEOpJniFTVo+MVqbs/MnYoA2wF6Gry4W5U
 ZiGQ==
X-Gm-Message-State: AO0yUKWfE0MyhmUkYxKNL2Y2/jzfdcRlKEpC864XmA5AfrC3qZ2GtF6k
 wfyctSY1S3otBHLqSPCtvfjonnabr8/knIZg2tlJEjMRLCalzhdC0ryjo8t06Vg3tzjSecoSO/q
 zPuywZH/BGEiFSZbta2lO2WxpqA==
X-Received: by 2002:ac8:5751:0:b0:3b9:bc8c:c1f8 with SMTP id
 17-20020ac85751000000b003b9bc8cc1f8mr28359397qtx.3.1678147881106; 
 Mon, 06 Mar 2023 16:11:21 -0800 (PST)
X-Google-Smtp-Source: AK7set8BM7AUsiRefOt1umMJ4Dth06Cpb8323Q/aybM3/LmMXC+QAMfwEyfV8FMCNIXFRNS5DobkXw==
X-Received: by 2002:ac8:5751:0:b0:3b9:bc8c:c1f8 with SMTP id
 17-20020ac85751000000b003b9bc8cc1f8mr28359368qtx.3.1678147880861; 
 Mon, 06 Mar 2023 16:11:20 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 m190-20020a3758c7000000b006ff8a122a1asm8411153qkb.78.2023.03.06.16.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 16:11:20 -0800 (PST)
Message-ID: <5882bd80983ac04a32676f07622cba7d0e245e55.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Zheng Wang <zyytlz.wz@163.com>, nouveau@lists.freedesktop.org
Date: Mon, 06 Mar 2023 19:11:18 -0500
In-Reply-To: <20221029074654.203153-1-zyytlz.wz@163.com>
References: <20221029074654.203153-1-zyytlz.wz@163.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: fix use-after-free bug in
 nvkm_vmm_pfn_map
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
Cc: alex000young@gmail.com, security@kernel.org, hackerzheng666@gmail.com,
 linux-kernel@vger.kernel.org, Julia.Lawall@inria.fr, bskeggs@redhat.com,
 daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Actually - could you resend this with dri-devel@lists.freedesktop.org added=
 to
the cc list just to make patchwork happy?

On Sat, 2022-10-29 at 15:46 +0800, Zheng Wang wrote:
> If it failed in kzalloc, vma will be freed in nvkm_vmm_node_merge.
> The later use of vma will casue use after free.
>=20
> Reported-by: Zheng Wang <hackerzheng666@gmail.com>
> Reported-by: Zhuorao Yang <alex000young@gmail.com>
>=20
> Fix it by returning to upper caller as soon as error occurs.
>=20
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.c
> index ae793f400ba1..04befd28f80b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -1272,8 +1272,7 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u6=
4 addr, u64 size, u64 *pfn)
>  =09=09=09=09=09=09       page -
>  =09=09=09=09=09=09       vmm->func->page, map);
>  =09=09=09if (WARN_ON(!tmp)) {
> -=09=09=09=09ret =3D -ENOMEM;
> -=09=09=09=09goto next;
> +=09=09=09=09return -ENOMEM;
>  =09=09=09}
> =20
>  =09=09=09if ((tmp->mapped =3D map))

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

