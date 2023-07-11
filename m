Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D374E570
	for <lists+nouveau@lfdr.de>; Tue, 11 Jul 2023 05:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29E710E2F8;
	Tue, 11 Jul 2023 03:43:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4338910E2F9
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 03:43:42 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0RYR1d5QzBJJjv
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 11:43:39 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689047019; x=1691639020; bh=PROXNSRNkmtHn8K/s7RFD4PL/CT
 OhC4irdWGixGUyVM=; b=1C/rS180+1xqNa9qU67FhPsrfoKHF13ZcVl5yEw35Ir
 h+0Z/gF7udnawEOTpzRJSXtkP1M5keVlBF3ZDZJRGQxN24LGwJbjbFvUPR4EIP9P
 Pzo6l8hhlccC9Y4u6UeSIyMHV+JqeTneiCNFF0TMvdKalvfJcGRk/yGqjEfEuzka
 yxLBW6fxI90ASVftLXIInXg2rcNVORdupRfD1y/6YOZ8eQWej0oM6sHVjmFg7E4h
 1xsonX6nLDXcKQhkbjfEwK3IXA6fExZENeKuf1Bq+CX3Vh9yp6U642voj6ZamPoC
 W3lcrc14mH74Q22+ETow9bHY7UotrnieR39So6TPQMA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m8RNTwtiZpee for <nouveau@lists.freedesktop.org>;
 Tue, 11 Jul 2023 11:43:39 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0RYQ6Q7mzBJ8kq;
 Tue, 11 Jul 2023 11:43:38 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 11:43:38 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230711034221.79302-1-xujianghui@cdjrlc.com>
References: <20230711034221.79302-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <4a21bb7bb79108ae96518a8d1372ef1d@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] [PATCH] drm/nouveau/flcn/qmgr: Move assignment outside if
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

Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c 
b/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c
index a453de341a75..48abdb124326 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/qmgr.c
@@ -73,7 +73,8 @@ nvkm_falcon_qmgr_new(struct nvkm_falcon *falcon,
      struct nvkm_falcon_qmgr *qmgr;
      int i;

-    if (!(qmgr = *pqmgr = kzalloc(sizeof(*qmgr), GFP_KERNEL)))
+    qmgr = *pqmgr = kzalloc(sizeof(*qmgr), GFP_KERNEL);
+    if (!qmgr)
          return -ENOMEM;

      qmgr->falcon = falcon;
