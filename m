Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2CD3AF08
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 16:31:40 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 214D210E483;
	Mon, 19 Jan 2026 15:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ucI4Eg3R";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ADA1244CAB;
	Mon, 19 Jan 2026 15:22:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768836176;
 b=BzH34XDeHxbOHprqkH12+k5LjdztQZV21PTncYqu3sbeqPd39Sj9gC0e3p5K7737/2yz7
 3gql0huO22neSkbB1ZDBbB1LpCZ6Cmh2ENn0Il7KwEkdU0OCXxKwkKGPKKDlNUM0zFaRQaX
 3E5bPiNeOP71+PRicAS6yfSZjm/TBl5c6cXd2FkjI4Dj5VmpWqkjoC2usmWdKe/3Y/5/Cph
 ecEYObdoYN0Y4dm3jdGj5bUyrrpLH7G3J4QMohBOMEQOOS54VDErfod25lgbaCj6+3SJk4H
 FeYD2Naa1vrT8rJ4zSiQE6XjRVKkCKMFyoNzdeEPjcQtYz7Ik47BXINx6lLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768836176; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=C38xOThu2akClnZlOKYtM8mMm0EDVJ2NoMuYmd/ErN8=;
 b=DrhLFfc1YdOZZbHpVi7gZis0IIlSc3/vDwXHrhk+lECPHD8WObNpEXViJQaqUcw/vTgkf
 LthPRx9Awsrqd+C2KHQ2MNBhnE/e1AQtS9KWC8/zKBJJgqX5IHN28ajjIS9YaUQ+KXq+ojM
 T2Gm+NQxP39NDeZjI/H7OFFGtOReN+8dCCfGNQdCaUE9owySEslvy8Dxq0m/c1Z5hAGClr1
 tQMvc8CnW2/C8g80exgAJgtoUUf7vHhLKkPvxdemPWZ3In4fn3vCDrOTSyKMynSFk3JdegA
 YtbXUj6d+tZ1CrB7g9zHRiZHBHNRSHzWM54xsUsE5CUuWvnvHDvp3iqly+Kw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 586DC44BB3
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 15:22:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7745010E19B;
	Mon, 19 Jan 2026 15:31:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8054660055;
	Mon, 19 Jan 2026 15:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23105C116C6;
	Mon, 19 Jan 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836694;
	bh=R4jVPr/K6xpQd5trxW23FdPhEhh//UE/8gc+kZSHETk=;
	h=From:To:Cc:Subject:Date:From;
	b=ucI4Eg3RzHVvlO55oTCrqSWKV/RWoSjn7S5KZf2XHWBJqb458OIryuJtlvCHe9QL4
	 QMnxObb08e7/gcjQtE4JYgxFsmM3pFoD3EM2qViIKFL2Y4UTci3rJRM8yqVU5BSBID
	 +bhIVsasVhaZKdW802QHqmAMPuF6lmndNcWWdL6azyEs5tdX3iu2BlSRLGcr202vc8
	 pDb6blMh4ora//8Gipn8wDbnMJA0BE5jIbY31PphqwkWOvcld2EdMSMMFj369Hk0G5
	 EBmooFo6Whgn7fy0B1L15C0snvkPzpwsRz+7KaUQifd/Ili+zj/mExqe5b4WiBG0s9
	 8knw5b7jPpqWw==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com
Subject: [PATCH 1/2] Documentation: nova: remove completed tasks
Date: Mon, 19 Jan 2026 16:31:04 +0100
Message-ID: <20260119153129.59876-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 45RO2IR77E5XEPTVNUOMNRM3HN2LD6AD
X-Message-ID-Hash: 45RO2IR77E5XEPTVNUOMNRM3HN2LD6AD
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/45RO2IR77E5XEPTVNUOMNRM3HN2LD6AD/>
Archived-At: 
 <https://lore.freedesktop.org/20260119153129.59876-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Remove completed tasks from Nova's task list.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 Documentation/gpu/nova/core/todo.rst | 42 ----------------------------
 1 file changed, 42 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 35cc7c31d423..2d920ee76ab0 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -134,21 +134,6 @@ A `num` core kernel module is being designed to provide these operations.
 | Complexity: Intermediate
 | Contact: Alexandre Courbot
 
-IRQ abstractions
-----------------
-
-Rust abstractions for IRQ handling.
-
-There is active ongoing work from Daniel Almeida [1] for the "core" abstractions
-to request IRQs.
-
-Besides optional review and testing work, the required ``pci::Device`` code
-around those core abstractions needs to be worked out.
-
-| Complexity: Intermediate
-| Link: https://lore.kernel.org/lkml/20250122163932.46697-1-daniel.almeida@collabora.com/ [1]
-| Contact: Daniel Almeida
-
 Page abstraction for foreign pages
 ----------------------------------
 
@@ -161,17 +146,6 @@ There is active onging work from Abdiel Janulgue [1] and Lina [2].
 | Link: https://lore.kernel.org/linux-mm/20241119112408.779243-1-abdiel.janulgue@gmail.com/ [1]
 | Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net/ [2]
 
-Scatterlist / sg_table abstractions
------------------------------------
-
-Rust abstractions for scatterlist / sg_table.
-
-There is preceding work from Abdiel Janulgue, which hasn't made it to the
-mailing list yet.
-
-| Complexity: Intermediate
-| Contact: Abdiel Janulgue
-
 PCI MISC APIs
 -------------
 
@@ -180,22 +154,6 @@ capability, MSI API abstractions.
 
 | Complexity: Beginner
 
-XArray bindings [XARR]
-----------------------
-
-We need bindings for `xa_alloc`/`xa_alloc_cyclic` in order to generate the
-auxiliary device IDs.
-
-| Complexity: Intermediate
-
-Debugfs abstractions
---------------------
-
-Rust abstraction for debugfs APIs.
-
-| Reference: Export GSP log buffers
-| Complexity: Intermediate
-
 GPU (general)
 =============
 

base-commit: 086714bbb96f63785da251e1f8d1ce3e716a6e42
-- 
2.52.0

