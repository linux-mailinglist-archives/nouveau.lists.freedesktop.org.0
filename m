Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D176493D
	for <lists+nouveau@lfdr.de>; Thu, 27 Jul 2023 09:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227710E4FE;
	Thu, 27 Jul 2023 07:48:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jul 2023 07:48:22 UTC
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A6D10E4FE
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jul 2023 07:48:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0VoJlfUx_1690443778; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VoJlfUx_1690443778) by smtp.aliyun-inc.com;
 Thu, 27 Jul 2023 15:43:09 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: rostedt@goodmis.org
Date: Thu, 27 Jul 2023 15:42:56 +0800
Message-Id: <20230727074256.118672-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] x86/mm/kmmio: return -ENOMEM when kzalloc failed
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, x86@kernel.org,
 peterz@infradead.org, nouveau@lists.freedesktop.org,
 dave.hansen@linux.intel.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, ppaalanen@gmail.com, mingo@redhat.com,
 bp@alien8.de, mhiramat@kernel.org, luto@kernel.org, hpa@zytor.com,
 tglx@linutronix.de
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The driver is using -1 instead of the -ENOMEM defined macro to specify
that a buffer allocation failed.

arch/x86/mm/kmmio.c:392 add_kmmio_fault_page() warn: returning -1 instead of -ENOMEM is sloppy.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6002
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/x86/mm/kmmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index 9f82019179e1..9aa5bcf5a836 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -389,14 +389,14 @@ static int add_kmmio_fault_page(unsigned long addr)
 
 	f = kzalloc(sizeof(*f), GFP_ATOMIC);
 	if (!f)
-		return -1;
+		return -ENOMEM;
 
 	f->count = 1;
 	f->addr = addr;
 
 	if (arm_kmmio_fault_page(f)) {
 		kfree(f);
-		return -1;
+		return -ENOMEM;
 	}
 
 	list_add_rcu(&f->list, kmmio_page_list(f->addr));
-- 
2.20.1.7.g153144c

