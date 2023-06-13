Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1C7373FD
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A63510E371;
	Tue, 20 Jun 2023 18:21:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 008B410E303;
 Tue, 13 Jun 2023 03:01:59 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:47948.1267835893
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id EAD2B1002F6;
 Tue, 13 Jun 2023 11:01:56 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 f7147316d1f743978c2fb65587fab21b for bhelgaas@google.com; 
 Tue, 13 Jun 2023 11:01:58 CST
X-Transaction-ID: f7147316d1f743978c2fb65587fab21b
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 13 Jun 2023 11:01:44 +0800
Message-Id: <20230613030151.216625-2-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613030151.216625-1-15330273260@189.cn>
References: <20230613030151.216625-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Jun 2023 18:20:12 +0000
Subject: [Nouveau] [PATCH v7 1/8] PCI/VGA: Use unsigned type for the
 io_state variable
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, linux-pci@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

The io_state variable in the vga_arb_write() function is declared with
unsigned int type, while the vga_str_to_iostate() function takes int *
type. To keep them consistent, replace the third argument of
vga_str_to_iostate() function with the unsigned int * type.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/pci/vgaarb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 5a696078b382..c1bc6c983932 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -77,7 +77,7 @@ static const char *vga_iostate_to_str(unsigned int iostate)
 	return "none";
 }
 
-static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
+static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
 {
 	/* we could in theory hand out locks on IO and mem
 	 * separately to userspace but it can cause deadlocks */
-- 
2.25.1

