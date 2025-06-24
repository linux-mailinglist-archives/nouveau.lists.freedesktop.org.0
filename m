Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EFCAE6D42
	for <lists+nouveau@lfdr.de>; Tue, 24 Jun 2025 19:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6099610E616;
	Tue, 24 Jun 2025 17:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QvJlwfr2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266E610E608
 for <nouveau@lists.freedesktop.org>; Tue, 24 Jun 2025 17:05:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D4BBE44BF1;
 Tue, 24 Jun 2025 17:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2131FC4CEE3;
 Tue, 24 Jun 2025 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750784739;
 bh=GOfCFyj6V7D3ee9N0LOQqA+bW6sTRVVoMWyGasGzsiA=;
 h=From:To:Cc:Subject:Date:From;
 b=QvJlwfr2RTMVa7HYNisHAE11wAwE5Z7wf8PHmJuZ8+7KmV/96RWfdxB82Mc1Ybnrn
 YE0S3jNsBr06KD7ia4kaqxIIcT79L325VI62kQWE0V0Gd/tjnIMnMQlM42W9v2w9nF
 91/urBAfE7L50v6XWjgTO1nvHlNDNP7cpgPIw9RAirqWzJS6JUpaZqLkYMhZEjRs6f
 rEKCacHDEk6EszYnkE1ewr0IHo/HWhrDSGkaDa8S7Nescr1eZXJIHTnjFInYg5D0Ri
 hHUNMi2EmhpXceebKiUvtoZ0/FU7eBiP+ktoiNV1TvtGPIbm/Zdcq+ZTYQiNfVOifO
 v9LKs/GssBrJw==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	nouveau@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, jhubbard@nvidia.com,
 bskeggs@nvidia.com, joelagnelf@nvidia.com, ttabi@nvidia.com,
 apopple@nvidia.com, sbaskaran@nvidia.com, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: Add Alexandre Courbot as co-maintainer to
 nova-core
Date: Tue, 24 Jun 2025 19:05:16 +0200
Message-ID: <20250624170517.105148-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Alex has extensive experience with NVIDIA GPU support, is closely
involved in nova-core development, and brings valuable Rust expertise.

In addition to his technical contributions, Alex is actively engaged with
the broader community. He works closely with contributors and
stakeholders to identify and solve issues, fosters collaboration, and
helps ensure that the Nova driver evolves in alignment with the
community.

I trust him to take a key role in making the Nova driver a successful
upstream solution for NVIDIA GPUs in the Linux kernel.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b8..e694d06dc69f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7718,6 +7718,7 @@ F:	include/uapi/drm/nouveau_drm.h
 
 CORE DRIVER FOR NVIDIA GPUS [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
+M:	Alexandre Courbot <acourbot@nvidia.com>
 L:	nouveau@lists.freedesktop.org
 S:	Supported
 Q:	https://patchwork.freedesktop.org/project/nouveau/
-- 
2.49.0

