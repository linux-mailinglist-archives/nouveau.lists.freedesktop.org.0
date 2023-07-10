Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C332F74CE32
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779EC10E1DD;
	Mon, 10 Jul 2023 07:23:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C87810E1B8
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 07:06:52 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzw6J2TtnzBHXhF
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 15:06:48 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688972808; x=1691564809; bh=BVbkB5h19AUC2qXDaTRj4Iv4202
 uUhLlZMpa8f2uMTA=; b=Z8qGrsD36Ynz7iCv+V2O2wk50AhLMYQzwSzzdPxZvUp
 2hNn8EZ+RygiqTusv96oNn7B7BjRG0t6x6HEgevU3kP0X1MSn+o1I4Af3aCISYKg
 rFnWQVjUuP6A8DDqeC4IWS0FQXer3af/O618s8vO2YNj6iMmEKtSMgnodVUOhydd
 LomQebCBBc8UCEB4co9CfyrGBKogD01ubhgtEP7I5gCLLJbP+r/Gg9r7T/wd4ZGm
 SZcI5g4YUd1dldpuHgo/6YZlD7S6vLWtd3r5TQtTs2pnfxQ1BLI94+QvFIO8VB6N
 Sk+blS6miJ/2nzp5KBYvHXOFCn760NLyE0wOxXb1Pcg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3t-Lk3USknR0 for <nouveau@lists.freedesktop.org>;
 Mon, 10 Jul 2023 15:06:48 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzw6J0NQhzBHXh3;
 Mon, 10 Jul 2023 15:06:48 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 15:06:47 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230710070505.53916-1-xujianghui@cdjrlc.com>
References: <20230710070505.53916-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <1ddf673283e93e83d912066f2241b976@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/iccsense:
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

Fixed error: 'do not use assignment in if condition'

This patch fixes error: 'do not use assignment in if condition'
in drm/nouveau/iccsense

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 8f0ccd3664eb..2428f3d6e477 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -322,7 +322,8 @@ int
  nvkm_iccsense_new_(struct nvkm_device *device, enum nvkm_subdev_type 
type, int inst,
             struct nvkm_iccsense **iccsense)
  {
-    if (!(*iccsense = kzalloc(sizeof(**iccsense), GFP_KERNEL)))
+    *iccsense = kzalloc(sizeof(**iccsense), GFP_KERNEL);
+    if (!*iccsense)
          return -ENOMEM;
      INIT_LIST_HEAD(&(*iccsense)->sensors);
      INIT_LIST_HEAD(&(*iccsense)->rails);
