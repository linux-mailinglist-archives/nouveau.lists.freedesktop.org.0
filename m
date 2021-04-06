Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E5355AD0
	for <lists+nouveau@lfdr.de>; Tue,  6 Apr 2021 19:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECDB6E87D;
	Tue,  6 Apr 2021 17:53:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAF889BAB;
 Tue,  6 Apr 2021 09:08:08 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FF1ns4cs3zpVQt;
 Tue,  6 Apr 2021 17:05:21 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 17:07:53 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Tue, 6 Apr 2021 17:07:50 +0800
Message-ID: <20210406090750.2477-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210406090750.2477-1-thunder.leizhen@huawei.com>
References: <20210406090750.2477-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 06 Apr 2021 17:53:42 +0000
Subject: [Nouveau] [PATCH v2 1/1] drm/nouveau/dmem: Remove duplicated header
 file inclusion
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Delete one of the header files <nvif/if000c.h> that are included twice,
all included header files are then rearranged alphabetically.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17d02..8e7a1b6598e0659 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -19,26 +19,23 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "nouveau_dmem.h"
-#include "nouveau_drv.h"
-#include "nouveau_chan.h"
-#include "nouveau_dma.h"
-#include "nouveau_mem.h"
-#include "nouveau_bo.h"
-#include "nouveau_svm.h"
-
+#include <linux/hmm.h>
+#include <linux/sched/mm.h>
+#include <nvhw/class/cla0b5.h>
 #include <nvif/class.h>
-#include <nvif/object.h>
-#include <nvif/push906f.h>
 #include <nvif/if000c.h>
 #include <nvif/if500b.h>
 #include <nvif/if900b.h>
-#include <nvif/if000c.h>
-
-#include <nvhw/class/cla0b5.h>
+#include <nvif/object.h>
+#include <nvif/push906f.h>
 
-#include <linux/sched/mm.h>
-#include <linux/hmm.h>
+#include "nouveau_bo.h"
+#include "nouveau_chan.h"
+#include "nouveau_dma.h"
+#include "nouveau_dmem.h"
+#include "nouveau_drv.h"
+#include "nouveau_mem.h"
+#include "nouveau_svm.h"
 
 /*
  * FIXME: this is ugly right now we are using TTM to allocate vram and we pin
-- 
1.8.3


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
