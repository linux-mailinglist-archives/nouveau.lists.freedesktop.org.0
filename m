Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A71FB97D09
	for <lists+nouveau@lfdr.de>; Wed, 24 Sep 2025 01:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09410E20A;
	Tue, 23 Sep 2025 23:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="Ps589tdw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9D10E209
 for <nouveau@lists.freedesktop.org>; Tue, 23 Sep 2025 23:45:38 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8572d7b2457so8935385a.1
 for <nouveau@lists.freedesktop.org>; Tue, 23 Sep 2025 16:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1758671137;
 x=1759275937; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=++BDcrVfd8cbOjGvmaYRX2vch6rAhbqO/bo+q5Ibcdw=;
 b=Ps589tdw9RtybnEEC0SdgaLQEXXMTi0wK1eHZtb1m38lWic6Kyo6Q2J0nwqjHjX5iT
 rTxKXQWLABvypcVJP93js33MY6IGjidfZ75clTNxSrPKoGnTzH944fRJCvij8IL0OO53
 lYEOPNwCO6fyv6TgbQRvD5w9oUyCbxn0yq6N/fy0iVebFFyVc9KAE5eAxI4QluQsAbF3
 2//iiQVBGcqmz2O1HSk+Smt4cLScAhLUn+ngZ7/PrdicZjW0TM6VgKIhu2QV8D7GPcBh
 gl5d+aATQmW8Ivb/R+HCaki/DMnwHxwxYmjhc5UHS4kZQL+Ow2kGxfdHa7LyJFALMvgx
 IfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758671137; x=1759275937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=++BDcrVfd8cbOjGvmaYRX2vch6rAhbqO/bo+q5Ibcdw=;
 b=I7xIai68TQmoi/bwf3Af0cC0q5A3oaqjLG6XMufweX25XONOnD3QgV8Luvte8Lgdoj
 BCV/2CPUU1KhGpWfF6HE47MopEczCvDVvyE7B3fXqL0+6z7TmZzqKsWYIivwxcX3jhWZ
 VVYV0JKF+AJK3Q7hqYfOMrMt1HxxW5BRdSb1hYLVCe4POPrjUaSZAXVWzSOjNORQkHwV
 OoQJlPLhZPX5p9N+Lxa6wj38+WdAYQo/buW2/fsXlLunhtoqonZeVm9AD82rCxEJ35Yg
 yC3kNOwesrHZamgKHpsZgltgWIEUiDrPCX3obnaSaBB2yxuy1fiztAyPJfYcd86hX9p6
 RoRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbPb9IBAMFOYQw6CsxSItPE2jWwHItVjboFGeR1ITRSUS4gwI6U1Pr8rR/NG7imrVUGvSwcsm+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB3Ljtu/rskj6cmmuXzzm5wVCPFuAxJdksnND2L/x3pvWPsDLq
 lhYUnxqF6xgxh+LGyPPuyd2o3KPkkMq8wjShvNDvZjAUzjxrtHpFwM8qvVeKh4NaGi8=
X-Gm-Gg: ASbGncvYxKWtww4ZiOn/wfYf99MR7MDNkqL/yfbfR/1aDYnMckChLf45dqPjJzemBNa
 wjAaSjXM+GqWehB+d56F+M81BqVOUW+4Fn/8gYU16/6t6ltPlZ/fkw7yKxIXPGOpLxUwmfIPaHB
 ZDn/U4RKZXWb8tjto1Dp77M5mOLY/Y33cLzAAnJfyfmAGMvexsSfFsNLJ5Hq3QsdblwqWak62vU
 /BgYkQfd+PYBrQc1oAYrs1e8un7p89Oki2F5j9Og79RW66VKA10z21kGdS4aX6ECbaF1/tnFSyC
 7z+/YXZ0+J6FwF6Db/Xc5K8pEsP6vK3+LmMF+mKtNgohcrY/I1w8vtcw0HRM7/rsu6ZhYEmD8On
 VPrEA+je7iqOtgE1mpr31jyR1NctfpPDODXRC66f1MoxR5yL5eoW5VA==
X-Google-Smtp-Source: AGHT+IFRal9X7LmdVEfaQuCk72ASOcG+yGyjc8BySKHKJZwDq9QuviLD9HsnORDiS8CsTQ+WlxJuTw==
X-Received: by 2002:a05:620a:3956:b0:810:a62b:1950 with SMTP id
 af79cd13be357-856e758ca05mr63751885a.31.1758671137285; 
 Tue, 23 Sep 2025 16:45:37 -0700 (PDT)
Received: from m-kiwi.verizon.net ([71.190.100.175])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4bda86b4b94sm94131211cf.26.2025.09.23.16.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 16:45:36 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 0/1] nouveau: On nvc0 membar between semaphore write and
Date: Tue, 23 Sep 2025 19:42:58 -0400
Message-ID: <20250923234511.114077-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.51.0
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

This takes the fix from 2cb66ae604 ("nouveau: Membar before between semaphore writes and the interrupt") and also applies it to nvc0_fence.c.

I've tested this on both ampere and kepler. Unfortunately, I don't have a maxwell card to test on so that branch in the patch hasn't been tested yet.

Mel Henning (1):
  nouveau: On nvc0 membar between semaphore write and interrupt

 .../drm/nouveau/include/nvhw/class/cl906f.h   | 23 +++++
 .../drm/nouveau/include/nvhw/class/clb06f.h   | 54 +++++++++++
 .../drm/nouveau/include/nvhw/class/clc06f.h   | 93 +++++++++++++++++++
 .../gpu/drm/nouveau/include/nvif/push906f.h   |  2 +
 drivers/gpu/drm/nouveau/nvc0_fence.c          | 31 ++++++-
 5 files changed, 200 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clb06f.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc06f.h

-- 
2.51.0

