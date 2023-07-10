Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A074CE3F
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDC010E1D1;
	Mon, 10 Jul 2023 07:23:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4080710E1B8
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 07:22:04 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzwRs1gfPzBHXhC
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 15:22:01 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688973721; x=1691565722; bh=Gh6EO96d1xAiEk2mS1BrOEBqriM
 6TGQNOsWTpVDRBTg=; b=bcXuONgPFCFhEmvNus1glrMHcK66koNeg5ekp7gM+N6
 aZ9x8twCxrYlCoAZorB9cSE99YIec0JNogEP82wX1o+lQ280CpViL8yEEVh2Wdng
 pOKBoOsszwt+zz5XOa8rnNREz+ENXGrFCmZ1ke6twa5kwg/2kleoa4SgIcCP5kFI
 TKJFV/l0jwrIlK6cCEXH+PcsQuzBheqpXnBkhsNsirIolDCHbmg4WITFFrGg39Vu
 dU3H6YkvvmFj+QxE474BnnXTypk/1n77sCPzKv91yDxq6OzZewrQIVIJ0bEmqgF7
 qSkBdqH+4bGUbcm3n0J12bMHRfTpsnS3AGyOW2HOmAQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3qXVNJqujllp for <nouveau@lists.freedesktop.org>;
 Mon, 10 Jul 2023 15:22:01 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzwRr6QXYzBHXgs;
 Mon, 10 Jul 2023 15:22:00 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 15:22:00 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230710072012.54076-1-xujianghui@cdjrlc.com>
References: <20230710072012.54076-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <0b4bfadaf22077b14fe579c1935058ff@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/pci: ERROR: "foo * bar" should be
 "foo *bar"
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

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
index 6be87ecffc89..bc51987c5f5f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
@@ -147,7 +147,7 @@ gk104_pcie_set_link_speed(struct nvkm_pci *pci, enum 
nvkm_pcie_speed speed)
  }

  static int
-gk104_pcie_init(struct nvkm_pci * pci)
+gk104_pcie_init(struct nvkm_pci *pci)
  {
      enum nvkm_pcie_speed lnkctl_speed, max_speed, cap_speed;
      struct nvkm_subdev *subdev = &pci->subdev;
