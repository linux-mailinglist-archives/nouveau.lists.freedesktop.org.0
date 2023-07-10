Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0C74CE42
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF8510E1F3;
	Mon, 10 Jul 2023 07:23:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23110E0F1
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 06:11:36 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzttY225TzBHXh2
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 14:11:33 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688969493; x=1691561494; bh=azaJMEJAgL47SIIml1shBWGLWae
 rskcRy12zpLCLts0=; b=lmJcULnCX6PZwbkiAsTck1QMlEqS2jg1NZ/l6IEazPD
 dNPZZqYJZQLs0FLyQ9PUu0RD1nOchlhgsq2mqrJ4xdvEKog8eNe7imHEvNAumfiH
 IRzIv9INLi3NQLBij/EACfxdt7H4GImSkHDW9nckIsk37Z76kcMZwR6xm0rfB0SZ
 IAH3CujwsSRzCx1yF0hn1zgCIHzl7PlzudAgCTR5bQmKSttuv3xfwK8sIiD3yOC9
 bM/VwMqiZLA/KbR4kixcEipBEwH2rZHLEc0dFvCkvczLlt69rTDBgorau1YuVpbB
 +eWpHXagXdMPiXMQa0NLryso9KJjmQQ2jeedkC5suig==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SrI_RBNcNmJ1 for <nouveau@lists.freedesktop.org>;
 Mon, 10 Jul 2023 14:11:33 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzttX52cdzBHXgl;
 Mon, 10 Jul 2023 14:11:32 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 14:11:32 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230710055219.53210-1-xujianghui@cdjrlc.com>
References: <20230710055219.53210-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <2fb128f812c7bf59d7af52193e307cdc@208suo.com>
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
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c | 0
  1 file changed, 0 insertions(+), 0 deletions(-)
  mode change 100755 => 100644 
drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busnv04.c
old mode 100755
new mode 100644
