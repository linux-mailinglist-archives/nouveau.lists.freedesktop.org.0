Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CB3CBAB06
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B42210EAAD;
	Sat, 13 Dec 2025 12:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjFUHRrP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2C110E9DB
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jul 2025 09:33:15 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-748d982e97cso1678553b3a.1
 for <nouveau@lists.freedesktop.org>; Fri, 11 Jul 2025 02:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752226395; x=1752831195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8wFTFvOPl9z0oMG+Q2qe8rihqJLxAx1U3xn0MBTrYNM=;
 b=bjFUHRrPik7rZ0OfDXxGSFLOKPCsEnMCUq9vrepteEwqkXg3boW1VpCybJkSm076qU
 IZ6xEEBgJ/NeyxuA4GYNu0njxkgeRK6NVTaEqubUi5MRuZbS5vEmW7xKJg4Kc8uctFgK
 xdUGoy4j37kLNXfcYDXENE9C40nRvxH6ahxAMw8jmE/Z5F3aJWLb1IKKZI2cybaVpAJq
 GxKHM91MXPEa9oLhSmACz7hkek0qiBnu2CWFL2gNFIlha9mddnhqFl7a93oN0IoaDijW
 NawWDXh72WnOAtS1fet3OZaj3JJC7UQvjV4mqApbyVrG/OKSD76O05KPWBiP7k4u8fYx
 yZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752226395; x=1752831195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8wFTFvOPl9z0oMG+Q2qe8rihqJLxAx1U3xn0MBTrYNM=;
 b=Tqe6rPzxaT1h3diJq/d9yJNvMSJWkDuPUjJ4Az7m+QxnZwXXSONZUUTdz4r3NhQWFq
 XUUlsTDwWRfZ8rhVRIRDK8h9CeNVChnNQM5/SOiWn8EDyD+Je1OkhFppKsyIPUEyNA+i
 s8221eFUOfrwuI1BBuWluFy1pCiMUQyC9cheKR1CV4pWiKe0OpZrJU7ycvJPJKiZhiws
 /m0WR1EV40YgLd2NcD52ThNle4glzOO6AVhT6j4wjuYpely9CoIn4r5w+b2mQEEfhkzP
 hjqYPbI6/zjKEPTuxTQPpvhvJwIy3ErfRyoBcBTr1q4U984iI2dYCzJKokhbUUxefcdK
 lfZA==
X-Gm-Message-State: AOJu0Yw2p68jyPfzZUxYFQL7pkgEgd4D9fei0hz1ivAGzYBt9LaWCSQn
 CKp1F0cK6nBzOAEeYkb1SE8Iw2LfkoHPbnTQZRp/1SjoYdrk2YkZ8ukqUUZis+EfsI0=
X-Gm-Gg: ASbGncsF4Nm8bZMF1NhKTcrQYaKryiYAlpaCvNeUMP1QJRBtZ/4k9z+5k3YCjmEA00b
 SqEk4/MctSjT6ZjB2jZzF45e7w7jqIr3C6VAde0cQyTQBE8rzHChJAincp0qIMwv5ooqnl1Z62l
 oDKIkmlx2NtFMWm3OAzX8y3ktLNrWzYUNoE4MZhP+54GRZBq972g4YuZ0BA0ZChzEu2BWtLwKCG
 35bK1c4RnjZXu49b1l/Hq3ypgbUnSjk47fBpKGoFDGkFckvF8ty+VBngl5aCHOIJLNONcK5Isfg
 KLCCgm4EVd+ekyeQ963Qwryz1YhUPbfR79rhZig2TYumJg+CZk699ACz0ml+4LEVV5v+jeiDnxn
 9RcFeHURUIsdybGo/Xna2e6+U
X-Google-Smtp-Source: AGHT+IFFSuwIaCLVBb5ZROldrGzN0JMgD47p666PcsnY0hEhFbgeDqm2l5kN/9yg7CgsXFKs8rYxeg==
X-Received: by 2002:a05:6a20:6f03:b0:21c:fbf0:21bb with SMTP id
 adf61e73a8af0-2311ee4b155mr4208715637.24.1752226395106; 
 Fri, 11 Jul 2025 02:33:15 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6bc84asm4557889a12.44.2025.07.11.02.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:33:14 -0700 (PDT)
From: Quaternions <krakow20@gmail.com>
To: dakr@kernel.org
Cc: nouveau@lists.freedesktop.org,
	Quaternions <krakow20@gmail.com>
Subject: [PATCH] gpu: nova-core: fix bounds check In PmuLookupTableEntry::new,
 data is sliced from 2..6,
 but the bounds check data.len() < 5 does not satisfy those bounds.
Date: Fri, 11 Jul 2025 02:30:14 -0700
Message-ID: <20250711093015.28785-1-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 663fc50e8b66..5b5d9f38cbb3 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -901,7 +901,7 @@ struct PmuLookupTableEntry {
 
 impl PmuLookupTableEntry {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 5 {
+        if data.len() < 6 {
             return Err(EINVAL);
         }
 
-- 
2.50.1

