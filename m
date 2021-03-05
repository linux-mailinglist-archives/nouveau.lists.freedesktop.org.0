Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42932E56C
	for <lists+nouveau@lfdr.de>; Fri,  5 Mar 2021 10:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0F16E165;
	Fri,  5 Mar 2021 09:58:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B696E165;
 Fri,  5 Mar 2021 09:58:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26D6A64F1D;
 Fri,  5 Mar 2021 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614938289;
 bh=/lb8uN3ccDMS8ANXkjYL2gkpQf8TDnHZRLuIhsU6K5Q=;
 h=Date:From:To:Cc:Subject:From;
 b=NhlDLvtZ32Qy5Ze42To9z1nyExlHaEKoiU+ZYMkPdNC5Sll/sHGOjwLHz6SgGYhrH
 dTqSCaFpgnqSFJ/rGR0E4vShyZJ3rMxgezeJf4i57wbKnDIxi6eg2PZEb8/mOP/qbH
 T2XRiWTtPvzXH6Ro7Fx/+wwxNGTL2PpDfujAmisEqHxJxCoWsMJueaiY4d4LT7xyTR
 dAaKSlTNDS3KaCeKcpCA4dLS4RtUI7f9VZr/Xe60j82ELTRPu0BgSUAwy/sCjE+DM+
 G26yj1UlNxVR0AMJwowOEmUwU9R6lcaTFyMNiTSy30XoowkKS4yZgyzt60qhJ5OT5/
 E/iq9/zrJIoHQ==
Date: Fri, 5 Mar 2021 03:58:07 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20210305095807.GA142125@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Nouveau] [PATCH RESEND][next] drm/nouveau/therm: Fix fall-through
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
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
index 2b031d4eaeb6..684aff7437ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
@@ -41,6 +41,7 @@ pwm_info(struct nvkm_therm *therm, int line)
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
