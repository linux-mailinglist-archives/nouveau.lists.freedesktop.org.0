Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE71A9D27
	for <lists+nouveau@lfdr.de>; Wed, 15 Apr 2020 13:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58216E98E;
	Wed, 15 Apr 2020 11:43:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ABA6E98E;
 Wed, 15 Apr 2020 11:43:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36597214AF;
 Wed, 15 Apr 2020 11:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951026;
 bh=Lw5BH7pmk+9cni4ByfUZ7qQ8QaNhnIgwh6zVSoOuQGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cc/Oz0KoB1YJ2bplpsDxLS4AxOdmgjCbmEt0WN+LdxvpG8hvq1G4x/2gpcthnS8I6
 U+kr6DAdzZk6M0ASyV3HMAV0qtCG26jKtjpFCA0MyYzyB4FlWBIOFq4pM/2oiFJtuO
 TICBRf1byniazK5vThEtyPMvRziJIl6HyN8o7LEY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:41:45 -0400
Message-Id: <20200415114226.13103-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114226.13103-1-sashal@kernel.org>
References: <20200415114226.13103-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.5 065/106] drm/nouveau/svm: check for
 SVM initialized before migrating
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ralph Campbell <rcampbell@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

[ Upstream commit 822cab6150d3002952407a8297ff5a0d32bb7b54 ]

When migrating system memory to GPU memory, check that SVM has been
enabled. Even though most errors can be ignored since migration is
a performance optimization, return an error because this is a violation
of the API.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index df9bf1fd1bc0b..3ec5da025bea7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -171,6 +171,11 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	mm = get_task_mm(current);
 	down_read(&mm->mmap_sem);
 
+	if (!cli->svm.svmm) {
+		up_read(&mm->mmap_sem);
+		return -EINVAL;
+	}
+
 	for (addr = args->va_start, end = args->va_start + size; addr < end;) {
 		struct vm_area_struct *vma;
 		unsigned long next;
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
