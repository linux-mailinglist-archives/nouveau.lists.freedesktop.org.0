Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37629B97D0C
	for <lists+nouveau@lfdr.de>; Wed, 24 Sep 2025 01:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B595010E20C;
	Tue, 23 Sep 2025 23:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="WULp/O/3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36A810E209
 for <nouveau@lists.freedesktop.org>; Tue, 23 Sep 2025 23:45:49 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4cdf3772f1dso21593931cf.1
 for <nouveau@lists.freedesktop.org>; Tue, 23 Sep 2025 16:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1758671148;
 x=1759275948; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjJ5XcCRhgyVZ2PYWS6peg4SdjwUuIqyqOgfFrpIYDU=;
 b=WULp/O/3/B0bGtT+Ce497AQw1NCaD1yllimpJuAM4jTr1HoW9HRYRIMqJf4+DM8tra
 ZfzAhKUtzig1H5PA6ozwaPBLt9WxNtmQ/aYs9dVSj89pjiNj8OAkdH4E3VeZ0M2FbZcg
 hhJnAaPjJKZDzUP37EhJraD1zYmtXuN42qFZrL6G5Hr4KIsNnop/QbNF90kH380SCjm9
 Vh76CSCKiPOYB+d1sT1UXCwhq+CiME2N2h3jZTVH5uuR8A7rTMWgSuTi1jwioSG4K1k6
 MhVUCZpFLYZ4rMYzQ1+FiymZkbSRCVW3O2kuamuEqTPm1nH3nxxk9W9UGNL1b8HtUHsO
 2F+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758671148; x=1759275948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjJ5XcCRhgyVZ2PYWS6peg4SdjwUuIqyqOgfFrpIYDU=;
 b=q7OeV+J6+CFXcLp2HgpdPXDvXHecf3DsC9fIJvymLF7JEMcAvZarr6RD7Rsvj62eDB
 q2hyv12e+wOAFxBFBkypEu6DxzY7tL/t+CQZwBJN+bScXSMz7b7CsgdEwP2DV/069Qkz
 7p/uB49UAHCiaIZUI1F2OBayFsJVA/wPMlwV2R2PrAapvtckJOOVB4Y3zd7OeKvw/U1n
 xXSaCg6jlQo/f0wcciLDz3pgoa7zxaADIjcqVPEq1sZqhjnVnQsPl0AOwXu75RQ08Dnu
 DV1izIYre6p/W5DZXo9x4OKUwIwOOCdvE7/UosAKyjkDNodWe7urf9VG2QLmF8lKrfTp
 jXmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6bq0nua42oYYPUXc+q1pEeuHmSpbF6rvL3A5gDggbwVuwa3qKd851iVUUOLhpxygLwZ1lKgcR@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe68o95R2QR7UrFHvFyTa/o3YnS+mqi4WC98zOqBHnpu03d6gW
 eBkD4ZKvRiiGyaUn3CvV0I5CD7Mi2ODKrOJuZmJH/V6XiC6JGQ+huTproolO4TM9Vdc=
X-Gm-Gg: ASbGncsknS2Xt7dh1jtHty9tWKC8g+jkzxo2yJjxQ2e4OILsgxzdK4euItBhlKVX9No
 pJ3sAiG6GCOWbyjJDDQ1nF47INuHhcncDFToKFBMI466vdIviVA7RC+ySwzWIa/BAW9lVMVsPTX
 aPHNRamjufzXrRNHXHqINhubrYpuSnF65XbsIqRc0UKs/gPjFSFdgzKAp2Lz+iBgMh6PRxa5aOB
 Vb9pGhh5pvOTUpXwj3oSGEUBBLOATTRbZOiINh0fYihzkNtd6mF4w7YLmxjxFYbc1qhvj5zEleJ
 N+flWlS4yEuY5uzrKZkConw0liXzJRVpTF1vR3gZFCq+TaAp0TjiMAVvcVmbXjwSlfa8tPzC7z/
 0sOGEEQ8hC+THI98FCjdygmyldVkLv6vNO7CUAEy6Kyg=
X-Google-Smtp-Source: AGHT+IGaS+4ogbIuVFxDbsYybur0mw+fgKlMuWj1uG6NOugeh5atXxMdwJvYM/sryXDtfYV76X9pWQ==
X-Received: by 2002:a05:622a:1206:b0:4cc:228d:4b8b with SMTP id
 d75a77b69052e-4d3698e74f7mr51677601cf.32.1758671148203; 
 Tue, 23 Sep 2025 16:45:48 -0700 (PDT)
Received: from m-kiwi.verizon.net ([71.190.100.175])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4bda86b4b94sm94131211cf.26.2025.09.23.16.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 16:45:47 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] nouveau: On nvc0 membar between semaphore write and
 interrupt
Date: Tue, 23 Sep 2025 19:42:59 -0400
Message-ID: <20250923234511.114077-2-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923234511.114077-1-mhenning@darkrefraction.com>
References: <20250923234511.114077-1-mhenning@darkrefraction.com>
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

This takes the fix from 2cb66ae604 ("nouveau: Membar before between
semaphore writes and the interrupt") and applies it to nvc0_fence.c.

If I force my ampere system down the nvc0_fence path then I reproduce the
same issues with transfer queues + The Talos Principle that were fixed by
the above commit. This fixes that issue in exactly the same way for the
old code path.

Fixes: 60cdadace320 ("drm/nouveau/fence: use NVIDIA's headers for emit()")
Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
Cc: stable@vger.kernel.org
---
 .../drm/nouveau/include/nvhw/class/cl906f.h   | 23 +++++
 .../drm/nouveau/include/nvhw/class/clb06f.h   | 54 +++++++++++
 .../drm/nouveau/include/nvhw/class/clc06f.h   | 93 +++++++++++++++++++
 .../gpu/drm/nouveau/include/nvif/push906f.h   |  2 +
 drivers/gpu/drm/nouveau/nvc0_fence.c          | 31 ++++++-
 5 files changed, 200 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clb06f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc06f.h

diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/cl906f.h b/drivers/gpu/drm/nouveau/include/nvhw/class/cl906f.h
index 673d668885bb..529c785b4651 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/class/cl906f.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/cl906f.h
@@ -47,6 +47,29 @@
 #define NV906F_SEMAPHORED_RELEASE_SIZE_4BYTE                        0x00000001
 #define NV906F_NON_STALL_INTERRUPT                                 (0x00000020)
 #define NV906F_NON_STALL_INTERRUPT_HANDLE                                 31:0
+#define NV906F_MEM_OP_A                                            (0x00000028)
+#define NV906F_MEM_OP_A_OPERAND_LOW                                       31:2
+#define NV906F_MEM_OP_A_TLB_INVALIDATE_ADDR                               29:2
+#define NV906F_MEM_OP_A_TLB_INVALIDATE_TARGET                            31:30
+#define NV906F_MEM_OP_A_TLB_INVALIDATE_TARGET_VID_MEM               0x00000000
+#define NV906F_MEM_OP_A_TLB_INVALIDATE_TARGET_SYS_MEM_COHERENT      0x00000002
+#define NV906F_MEM_OP_A_TLB_INVALIDATE_TARGET_SYS_MEM_NONCOHERENT   0x00000003
+#define NV906F_MEM_OP_B                                            (0x0000002c)
+#define NV906F_MEM_OP_B_OPERAND_HIGH                                       7:0
+#define NV906F_MEM_OP_B_OPERATION                                        31:27
+#define NV906F_MEM_OP_B_OPERATION_SYSMEMBAR_FLUSH                   0x00000005
+#define NV906F_MEM_OP_B_OPERATION_SOFT_FLUSH                        0x00000006
+#define NV906F_MEM_OP_B_OPERATION_MMU_TLB_INVALIDATE                0x00000009
+#define NV906F_MEM_OP_B_OPERATION_L2_PEERMEM_INVALIDATE             0x0000000d
+#define NV906F_MEM_OP_B_OPERATION_L2_SYSMEM_INVALIDATE              0x0000000e
+#define NV906F_MEM_OP_B_OPERATION_L2_CLEAN_COMPTAGS                 0x0000000f
+#define NV906F_MEM_OP_B_OPERATION_L2_FLUSH_DIRTY                    0x00000010
+#define NV906F_MEM_OP_B_MMU_TLB_INVALIDATE_PDB                             0:0
+#define NV906F_MEM_OP_B_MMU_TLB_INVALIDATE_PDB_ONE                  0x00000000
+#define NV906F_MEM_OP_B_MMU_TLB_INVALIDATE_PDB_ALL                  0x00000001
+#define NV906F_MEM_OP_B_MMU_TLB_INVALIDATE_GPC                             1:1
+#define NV906F_MEM_OP_B_MMU_TLB_INVALIDATE_GPC_ENABLE               0x00000000
+#define NV906F_MEM_OP_B_MMU_TLB_INVALIDATE_GPC_DISABLE              0x00000001
 #define NV906F_SET_REFERENCE                                       (0x00000050)
 #define NV906F_SET_REFERENCE_COUNT                                        31:0
 
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clb06f.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clb06f.h
new file mode 100644
index 000000000000..15edc9d8dcbe
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clb06f.h
@@ -0,0 +1,54 @@
+/*******************************************************************************
+    Copyright (c) 2020, NVIDIA CORPORATION. All rights reserved.
+
+    Permission is hereby granted, free of charge, to any person obtaining a
+    copy of this software and associated documentation files (the "Software"),
+    to deal in the Software without restriction, including without limitation
+    the rights to use, copy, modify, merge, publish, distribute, sublicense,
+    and/or sell copies of the Software, and to permit persons to whom the
+    Software is furnished to do so, subject to the following conditions:
+
+    The above copyright notice and this permission notice shall be included in
+    all copies or substantial portions of the Software.
+
+    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+    DEALINGS IN THE SOFTWARE.
+
+*******************************************************************************/
+#ifndef _clb06f_h_
+#define _clb06f_h_
+
+/* fields and values */
+// NOTE - MEM_OP_A and MEM_OP_B have been removed for gm20x to make room for
+// possible future MEM_OP features.  MEM_OP_C/D have identical functionality
+// to the previous MEM_OP_A/B methods.
+#define NVB06F_MEM_OP_C                                            (0x00000030)
+#define NVB06F_MEM_OP_C_OPERAND_LOW                                       31:2
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_PDB                                 0:0
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_PDB_ONE                      0x00000000
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_PDB_ALL                      0x00000001
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_GPC                                 1:1
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_GPC_ENABLE                   0x00000000
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_GPC_DISABLE                  0x00000001
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_TARGET                            11:10
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_TARGET_VID_MEM               0x00000000
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_TARGET_SYS_MEM_COHERENT      0x00000002
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_TARGET_SYS_MEM_NONCOHERENT   0x00000003
+#define NVB06F_MEM_OP_C_TLB_INVALIDATE_ADDR_LO                           31:12
+#define NVB06F_MEM_OP_D                                            (0x00000034)
+#define NVB06F_MEM_OP_D_OPERAND_HIGH                                       7:0
+#define NVB06F_MEM_OP_D_OPERATION                                        31:27
+#define NVB06F_MEM_OP_D_OPERATION_MEMBAR                            0x00000005
+#define NVB06F_MEM_OP_D_OPERATION_MMU_TLB_INVALIDATE                0x00000009
+#define NVB06F_MEM_OP_D_OPERATION_L2_PEERMEM_INVALIDATE             0x0000000d
+#define NVB06F_MEM_OP_D_OPERATION_L2_SYSMEM_INVALIDATE              0x0000000e
+#define NVB06F_MEM_OP_D_OPERATION_L2_CLEAN_COMPTAGS                 0x0000000f
+#define NVB06F_MEM_OP_D_OPERATION_L2_FLUSH_DIRTY                    0x00000010
+#define NVB06F_MEM_OP_D_TLB_INVALIDATE_ADDR_HI                             7:0
+
+#endif /* _clb06f_h_ */
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clc06f.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clc06f.h
new file mode 100644
index 000000000000..4d0f13f79c17
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clc06f.h
@@ -0,0 +1,93 @@
+/*******************************************************************************
+    Copyright (c) 2020, NVIDIA CORPORATION. All rights reserved.
+
+    Permission is hereby granted, free of charge, to any person obtaining a
+    copy of this software and associated documentation files (the "Software"),
+    to deal in the Software without restriction, including without limitation
+    the rights to use, copy, modify, merge, publish, distribute, sublicense,
+    and/or sell copies of the Software, and to permit persons to whom the
+    Software is furnished to do so, subject to the following conditions:
+
+    The above copyright notice and this permission notice shall be included in
+    all copies or substantial portions of the Software.
+
+    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+    DEALINGS IN THE SOFTWARE.
+
+*******************************************************************************/
+#ifndef _clc06f_h_
+#define _clc06f_h_
+
+/* fields and values */
+// NOTE - MEM_OP_A and MEM_OP_B have been replaced in gp100 with methods for
+// specifying the page address for a targeted TLB invalidate and the uTLB for
+// a targeted REPLAY_CANCEL for UVM.
+// The previous MEM_OP_A/B functionality is in MEM_OP_C/D, with slightly
+// rearranged fields.
+#define NVC06F_MEM_OP_A                                            (0x00000028)
+#define NVC06F_MEM_OP_A_TLB_INVALIDATE_CANCEL_TARGET_CLIENT_UNIT_ID        5:0  // only relevant for REPLAY_CANCEL_TARGETED
+#define NVC06F_MEM_OP_A_TLB_INVALIDATE_CANCEL_TARGET_GPC_ID               10:6  // only relevant for REPLAY_CANCEL_TARGETED
+#define NVC06F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR                         11:11
+#define NVC06F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR_EN                 0x00000001
+#define NVC06F_MEM_OP_A_TLB_INVALIDATE_SYSMEMBAR_DIS                0x00000000
+#define NVC06F_MEM_OP_A_TLB_INVALIDATE_TARGET_ADDR_LO                    31:12
+#define NVC06F_MEM_OP_B                                            (0x0000002c)
+#define NVC06F_MEM_OP_B_TLB_INVALIDATE_TARGET_ADDR_HI                     31:0
+#define NVC06F_MEM_OP_C                                            (0x00000030)
+#define NVC06F_MEM_OP_C_MEMBAR_TYPE                                        2:0
+#define NVC06F_MEM_OP_C_MEMBAR_TYPE_SYS_MEMBAR                      0x00000000
+#define NVC06F_MEM_OP_C_MEMBAR_TYPE_MEMBAR                          0x00000001
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB                                 0:0
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB_ONE                      0x00000000
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB_ALL                      0x00000001  // Probably nonsensical for MMU_TLB_INVALIDATE_TARGETED
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_GPC                                 1:1
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_GPC_ENABLE                   0x00000000
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_GPC_DISABLE                  0x00000001
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_REPLAY                              4:2  // only relevant if GPC ENABLE
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_REPLAY_NONE                  0x00000000
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_REPLAY_START                 0x00000001
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_REPLAY_START_ACK_ALL         0x00000002
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_TARGETED       0x00000003
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_REPLAY_CANCEL_GLOBAL         0x00000004
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE                            6:5  // only relevant if GPC ENABLE
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_NONE                0x00000000
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_GLOBALLY            0x00000001
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_ACK_TYPE_INTRANODE           0x00000002
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL                    9:7  // Invalidate affects this level and all below
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_ALL         0x00000000  // Invalidate tlb caches at all levels of the page table
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_PTE_ONLY    0x00000001
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE0  0x00000002
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE1  0x00000003
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE2  0x00000004
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE3  0x00000005
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE4  0x00000006
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PAGE_TABLE_LEVEL_UP_TO_PDE5  0x00000007
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE                          11:10  // only relevant if PDB_ONE
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_VID_MEM             0x00000000
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_SYS_MEM_COHERENT    0x00000002
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB_APERTURE_SYS_MEM_NONCOHERENT 0x00000003
+#define NVC06F_MEM_OP_C_TLB_INVALIDATE_PDB_ADDR_LO                       31:12  // only relevant if PDB_ONE
+// MEM_OP_D MUST be preceded by MEM_OPs A-C.
+#define NVC06F_MEM_OP_D                                            (0x00000034)
+#define NVC06F_MEM_OP_D_TLB_INVALIDATE_PDB_ADDR_HI                        26:0  // only relevant if PDB_ONE
+#define NVC06F_MEM_OP_D_OPERATION                                        31:27
+#define NVC06F_MEM_OP_D_OPERATION_MEMBAR                            0x00000005
+#define NVC06F_MEM_OP_D_OPERATION_MMU_TLB_INVALIDATE                0x00000009
+#define NVC06F_MEM_OP_D_OPERATION_MMU_TLB_INVALIDATE_TARGETED       0x0000000a
+#define NVC06F_MEM_OP_D_OPERATION_L2_PEERMEM_INVALIDATE             0x0000000d
+#define NVC06F_MEM_OP_D_OPERATION_L2_SYSMEM_INVALIDATE              0x0000000e
+// CLEAN_LINES is an alias for Tegra/GPU IP usage
+#define NVC06F_MEM_OP_D_OPERATION_L2_INVALIDATE_CLEAN_LINES         0x0000000e
+// This B alias is confusing but it was missed as part of the update. Left here
+// for compatibility.
+#define NVC06F_MEM_OP_B_OPERATION_L2_INVALIDATE_CLEAN_LINES         0x0000000e
+#define NVC06F_MEM_OP_D_OPERATION_L2_CLEAN_COMPTAGS                 0x0000000f
+#define NVC06F_MEM_OP_D_OPERATION_L2_FLUSH_DIRTY                    0x00000010
+#define NVC06F_MEM_OP_D_OPERATION_L2_WAIT_FOR_SYS_PENDING_READS     0x00000015
+
+#endif /* _clc06f_h_ */
diff --git a/drivers/gpu/drm/nouveau/include/nvif/push906f.h b/drivers/gpu/drm/nouveau/include/nvif/push906f.h
index 79df71de98d2..3d506f4dc2c9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/push906f.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/push906f.h
@@ -7,6 +7,8 @@
 #ifndef PUSH906F_SUBC
 // Host methods
 #define PUSH906F_SUBC_NV906F	0
+#define PUSH906F_SUBC_NVB06F	0
+#define PUSH906F_SUBC_NVC06F	0
 #define PUSH906F_SUBC_NVC36F	0
 
 // Twod
diff --git a/drivers/gpu/drm/nouveau/nvc0_fence.c b/drivers/gpu/drm/nouveau/nvc0_fence.c
index a5e98d0d4217..8b36deaaf8cf 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fence.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fence.c
@@ -27,15 +27,18 @@
 
 #include "nv50_display.h"
 
+#include <nvif/class.h>
 #include <nvif/push906f.h>
 
 #include <nvhw/class/cl906f.h>
+#include <nvhw/class/clb06f.h>
+#include <nvhw/class/clc06f.h>
 
 static int
 nvc0_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 {
 	struct nvif_push *push = &chan->chan.push;
-	int ret = PUSH_WAIT(push, 6);
+	int ret = PUSH_WAIT(push, 12);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV906F, SEMAPHOREA,
 			  NVVAL(NV906F, SEMAPHOREA, OFFSET_UPPER, upper_32_bits(virtual)),
@@ -46,9 +49,31 @@ nvc0_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 					SEMAPHORED,
 			  NVDEF(NV906F, SEMAPHORED, OPERATION, RELEASE) |
 			  NVDEF(NV906F, SEMAPHORED, RELEASE_WFI, EN) |
-			  NVDEF(NV906F, SEMAPHORED, RELEASE_SIZE, 16BYTE),
+			  NVDEF(NV906F, SEMAPHORED, RELEASE_SIZE, 16BYTE));
+
+		if (chan->user.oclass >= PASCAL_CHANNEL_GPFIFO_A) {
+			PUSH_MTHD(push, NVC06F, MEM_OP_A, 0,
+						MEM_OP_B, 0,
+
+						MEM_OP_C,
+				  NVDEF(NVC06F, MEM_OP_C, MEMBAR_TYPE, SYS_MEMBAR),
+
+						MEM_OP_D,
+				  NVDEF(NVC06F, MEM_OP_D, OPERATION, MEMBAR));
+		} else if (chan->user.oclass >= MAXWELL_CHANNEL_GPFIFO_A) {
+			PUSH_MTHD(push, NVB06F, MEM_OP_C, 0,
+
+						MEM_OP_D,
+				  NVDEF(NVC06F, MEM_OP_D, OPERATION, MEMBAR));
+		} else {
+			PUSH_MTHD(push, NV906F, MEM_OP_A, 0,
+
+						MEM_OP_B,
+				  NVDEF(NV906F, MEM_OP_B, OPERATION, SYSMEMBAR_FLUSH));
+		}
+
+		PUSH_MTHD(push, NV906F, NON_STALL_INTERRUPT, 0);
 
-					NON_STALL_INTERRUPT, 0);
 		PUSH_KICK(push);
 	}
 	return ret;
-- 
2.51.0

