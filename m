Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D44474CE30
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F6710E1DC;
	Mon, 10 Jul 2023 07:23:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBF110E15F
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 04:07:18 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzr765SD7zBHXgj
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 12:07:14 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688962034; x=1691554035; bh=gRcZ3CLGEDPxZrkiTCKDOKBlXr/
 +k73D4egciW6sOpk=; b=eWvhsixi8tKjM7NCs0B685IGtqjz+l+82IYFkC6Q6Kt
 KS7HOty57NlUX61nnsMm8JaH530Opl2oTRhp35xMGB3GsAo5KO+LyMzK9e36K7Wn
 x0bIcFxIwFlGRmYjhOb6kYHG1B1aR3ra4LjkEi12memAeQUnZnYT7/L5dE7Pp+dh
 ulAXNVs7BY4DD1r8KdB9IP8qp+BwlpCzdfMfmR4VXOccx86/iVztg4qo1df+HSMT
 od/iIl4mMmKNHpreU6MMpp0DUWuW/DOLVMCSxc5Eh+K6UfLD4DyBPvfZfignm7lT
 NXzt+ky51giZ2x1NOVfHAvm9PeWGaZTZIBiaSekhDmA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id c13Yy1dWVYHG for <nouveau@lists.freedesktop.org>;
 Mon, 10 Jul 2023 12:07:14 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzr762vBwzBHXgf;
 Mon, 10 Jul 2023 12:07:14 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 12:07:14 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230710032131.52747-1-xujianghui@cdjrlc.com>
References: <20230710032131.52747-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <decd9e6f68cbebda22d6648fa7b9b737@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/nvkm: do not use assignment in if
 condition
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

ERROR: do not use assignment in if condition

Signed-off-by:Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
index 976539de4220..054fa42f1d04 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
@@ -286,7 +286,8 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func, 
struct nvkm_device *device,

          if (ccbE.share != DCB_I2C_UNUSED) {
              const int id = NVKM_I2C_PAD_HYBRID(ccbE.share);
-            if (!(pad = nvkm_i2c_pad_find(i2c, id)))
+            pad = nvkm_i2c_pad_find(i2c, id);
+            if (!pad)
                  ret = func->pad_s_new(i2c, id, &pad);
              else
                  ret = 0;
