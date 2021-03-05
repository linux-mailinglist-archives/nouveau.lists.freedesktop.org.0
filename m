Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359DB32E561
	for <lists+nouveau@lfdr.de>; Fri,  5 Mar 2021 10:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EA96EB3B;
	Fri,  5 Mar 2021 09:56:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD166EB3B;
 Fri,  5 Mar 2021 09:56:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2972B601FE;
 Fri,  5 Mar 2021 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614938171;
 bh=hoQ19clzhxWtId19+87S7OFAK0lAZssf3HE94ZT3lAE=;
 h=Date:From:To:Cc:Subject:From;
 b=Cf+W81nk2RNf/cBzAjxflmCnPcLLtAEqSuukozJOPUVFblqMZjHU03gIjSZUzGCRT
 WtLkKHB64mFzN7Khk99CGVQ4tSLBtfvu7FaqG1+AcXvNf+7kQp0sTfYHnFD/2mMV+3
 S/tNiop3x1MnXm+RgQkNmA1+S/sAaq9BrFRCGn4bfO4pOyUEKv/lj6LEtCF5KfAmIc
 KG1L3dDGaYa2X9/0ew8OosbnhGWcOj0nf6H5AFDF7R2bk4tg3DQMV2RBCRvPP8jz/S
 Ch7zI3zzL/PdJbrqjv0D1Kv0jUAXy8BcNk1/muvoI+/QHCgEOf3ZElakqvtANC4paN
 ElXGZE4cYJ9FQ==
Date: Fri, 5 Mar 2021 03:56:09 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20210305095609.GA141907@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Nouveau] [PATCH RESEND][next] drm/nouveau/clk: Fix fall-through
 warnings for Clang
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
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
index 83067763c0ec..e1d31c62f9ec 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
@@ -313,6 +313,7 @@ nv50_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
 		default:
 			break;
 		}
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
