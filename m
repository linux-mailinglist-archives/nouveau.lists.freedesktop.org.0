Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55074E39F
	for <lists+nouveau@lfdr.de>; Tue, 11 Jul 2023 03:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE31610E192;
	Tue, 11 Jul 2023 01:42:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2110E198
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 01:42:48 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0Nsw3VXKzBHXhj
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jul 2023 09:42:44 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689039763; x=1691631764; bh=lSZQXAxYJar3o8ZAu0tDXbav933
 mwLp+FmKH8/B8NRk=; b=K1ZC69LGdxsYnBbBxRoYnYfQo2JF8gzVzXPzYlX0bmq
 c7m3oHyTcPQXJhAVEKD9bRqKYHiODZ2MEWsl2kiswkz4HejO0Tf8enHA48NK8lLt
 RMMRyH5EgmlZCrv1LmEfaYvfXX4J5OI7Iwoi56NLvlXR+XKkGVz+Qf+pWsYDM0T+
 gh968rb45p0orS240Yjk24ea93+FkihbFvhr3l3zvRwHNW7fGb3054eGlFWz2UEQ
 6AdjpS0qRxni+yYirKPwGpCIrJK1mCi2kyXs01p7BGUnTTMfY7uKXrmlOxCG/GM1
 I9FzZfD+i3ytOnLh7mRU2Mw9vG04mNCA6q2IwTbQhaA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aZuw4zcdFCYh for <nouveau@lists.freedesktop.org>;
 Tue, 11 Jul 2023 09:42:43 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0Nsv4xPmzBHXh5;
 Tue, 11 Jul 2023 09:42:43 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 09:42:43 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230711013754.77743-1-xujianghui@cdjrlc.com>
References: <20230711013754.77743-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <9d43392febad17411b442e39e729ca4b@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] [PATCH] drm/nouveau/pmu: add spaces around '='
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

This fixes the checkpatch.pl errors:

ERROR: spaces required around that '=' (ctx:VxW)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c
index b5e52b35f5d0..d3e67c41560d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gk20a.c
@@ -98,7 +98,7 @@ gk20a_pmu_dvfs_get_dev_status(struct gk20a_pmu *pmu,
      struct nvkm_falcon *falcon = &pmu->base.falcon;

      status->busy = nvkm_falcon_rd32(falcon, 0x508 + (BUSY_SLOT * 
0x10));
-    status->total= nvkm_falcon_rd32(falcon, 0x508 + (CLK_SLOT * 0x10));
+    status->total = nvkm_falcon_rd32(falcon, 0x508 + (CLK_SLOT * 
0x10));
  }

  static void
@@ -188,7 +188,7 @@ gk20a_pmu_init(struct nvkm_pmu *pmu)
  }

  static struct gk20a_pmu_dvfs_data
-gk20a_dvfs_data= {
+gk20a_dvfs_data = {
      .p_load_target = 70,
      .p_load_max = 90,
      .p_smooth = 1,
