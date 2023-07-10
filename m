Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA774CE2C
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AE310E1D5;
	Mon, 10 Jul 2023 07:23:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA56110E1A8
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 06:31:22 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzvKM5JbBzBHXh9
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 14:31:19 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688970679; x=1691562680; bh=aTlm6Xb7XXh6jhxQV0R2zMsPiDO
 qv5eG9s4lBNA59SU=; b=ltMav5J8wazDv3YZNCFgd3oFcSatAp7nwnZXwjxtiqi
 nm/jKVHuqLGU/QE4ekoH223zlVF2k5VKU7TTK0DtD4tpwdlvfXJOFlujJq/GnhuA
 /NRAwxvXTbVG26RhyUEmsvl4HUICeHmmK1ssjBw/3CDMQIFpj+3bP4/Q5dww0lbE
 OVlzx5F3j6eOwk0VDR+HdGzE3p7Nbh3l/AeGXVGVRP3LA+5Xi9eFmAgUXEMgJuZx
 34W+ZDx0e3W20KY3Hw0sMCHmYX1a8yj1aQc7sC1Wj401QHSrYQf7pPZbPMmF9WQn
 Ebfs+OcD0m9fbiO/omEH8Y2hSaUFS2y21jizxcgGVZA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QMdBD4fF4qRx for <nouveau@lists.freedesktop.org>;
 Mon, 10 Jul 2023 14:31:19 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzvKM2q8MzBHXgl;
 Mon, 10 Jul 2023 14:31:19 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 14:31:15 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230710062932.53655-1-xujianghui@cdjrlc.com>
References: <20230710062932.53655-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <7ab55aa7169d6a3bd0309b43c3de592e@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/i2c: do not use assignment in if
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

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
index d063d0dc13c5..098051d3755c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
@@ -209,7 +209,8 @@ nvkm_i2c_aux_new_(const struct nvkm_i2c_aux_func 
*func,
            struct nvkm_i2c_pad *pad, int id,
            struct nvkm_i2c_aux **paux)
  {
-    if (!(*paux = kzalloc(sizeof(**paux), GFP_KERNEL)))
+    *paux = kzalloc(sizeof(**paux), GFP_KERNEL);
+    if (!*paux)
          return -ENOMEM;
      return nvkm_i2c_aux_ctor(func, pad, id, *paux);
  }
