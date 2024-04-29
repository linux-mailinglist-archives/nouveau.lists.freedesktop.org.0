Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AACCBA946
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2EA10E7BB;
	Sat, 13 Dec 2025 12:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tZuttLM3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A94910EA43
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714400141;
 bh=+HgArwANycQymeI5ldrVtS468Zq2+ws8hnlvf1oqak8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZuttLM3Paf7w34fTyjCPLzwIrltV+vvWLyrsWboEFB27cJfsOjrQLAEuUoZG0VfB
 BtV9uvdc4afdVgKErzojMf9ZSvnWf7OfzbhY1FUn4DNyg309vhioNF4VwNX4Hu6bfM
 7Sgwd6lxkKqvv+glbW17t8++XPm9f6ig4gj7hXeV8cMC1+wEq7YkR4k4GENxOxSONZ
 GZSV5kPWpeJZ1RmyiCQ6yMI5OwA1oe4pokSfIO8hvbdzq7knWVliEllOGyPd5/+El7
 ALyXriDN1Pz2pOKZE4BFIpq0BVdsKdoWwq2XceMX237CuKktmDD/ro7rxHPa/HBedc
 B94Rqx2jgLpcQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D86CE3780BFE;
 Mon, 29 Apr 2024 14:15:39 +0000 (UTC)
Date: Mon, 29 Apr 2024 10:15:37 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "danishanwar@ti.com" <danishanwar@ti.com>
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Message-ID: <c5d25e0f-046e-4c8b-b89e-de784f489441@notapiano>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <c5ff8d3e-ecfc-4970-86c0-540b75b4be2e@ti.com>
 <2775775499487396fbad5c2327dcaf7fb88a524d.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2775775499487396fbad5c2327dcaf7fb88a524d.camel@nvidia.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:43 +0000
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

On Mon, Apr 29, 2024 at 12:40:25PM +0000, Timur Tabi wrote:
> On Mon, 2024-04-29 at 14:49 +0530, MD Danish Anwar wrote:
> > This patch seems to be breaking latest linux-next (tag: next-20240429).
> > While building kernel for arm64 on latest linux-next with defconfig, I
> > see build failure with below error.
> > 
> > ❯ make -j$(nproc) ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu-
> > 
> >   CALL    scripts/checksyscalls.sh
> >   CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function
> > ‘build_registry’:
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at
> > end of compound statement
> >  1266 |   default:
> >       |   ^~~~~~~
> > make[6]: *** [scripts/Makefile.build:244:
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
> 
> I've been writing C code for 30 years, and I can't remember ever seeing this
> compiler compaint.
> 
> 	default:
> 	}
> 
> Seems normal to me, and it doesn't fail on x86.  Try adding a "break;" between
> the two lines.
> 

Hi,

this build failure was also reproduced by KernelCI, and I reproduced it locally
too. So indeed this change breaks the build for arm64, with the same error
mentioned above:


  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function ‘build_registry’:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at end of compound statement
 1266 |   default:
      |   ^~~~~~~
make[6]: *** [scripts/Makefile.build:244: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1
make[5]: *** [scripts/Makefile.build:485: drivers/gpu/drm/nouveau] Error 2


Adding a break statement after the default label as you suggested did fix the
issue:


diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 0b46db5c77b8..63619512e7f6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1264,6 +1264,7 @@ static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry
                        str_offset += reg->vlen;
                        break;
                default:
+                       break;
                }

                i++;


Feel free to add my T-by when you send the fix:
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

#regzbot introduced: b58a0bc904ffa
#regzbot title: arm64 build failure with error 'label at end of compound statement' on next-20240429

Thanks,
Nícolas
