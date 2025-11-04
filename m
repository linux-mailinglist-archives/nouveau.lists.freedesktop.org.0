Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7ECBAEDD
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D31210EC33;
	Sat, 13 Dec 2025 12:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdGZMa7h";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C3810E665
 for <nouveau@lists.freedesktop.org>; Tue,  4 Nov 2025 19:38:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso28028195e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 04 Nov 2025 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762285087; x=1762889887; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+vu3BFi3eMkE8uZDd0o1RrqC7gSQvZv7E8xHlJ1qM4=;
 b=YdGZMa7hUACEBmSft8Le+RxEk5Lptf/QkHVFHJj8Es6nbdw0VfohHJIdActiathWIH
 R5Wv0OzyRUJDLYMvMzZuo4onpZTb8vfgK4Um3bVdx4HGuaaHYAKBOmuSnenpRbYP6HgS
 ah6Tme1EAzNpZETlfYDZrAUAqlaakpSXZNNTMogyEdQLBhC/ZhOGbSiEwwnIBqaEQJ3F
 66a9XTf/kEl2lRi2vdZ6AGYpQL6e35bFLgZB6PjJimhyP0OP1QtdhUvLqz101zNbKK+F
 GXBz7aOv+i70tjM9nHNU7XZ4JK58kFADQveyFqGLLN/tCKY6pNsMn584FiafpKh3HVUo
 mr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762285087; x=1762889887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+vu3BFi3eMkE8uZDd0o1RrqC7gSQvZv7E8xHlJ1qM4=;
 b=Jq5NkRKEO5pNJykkvg80CqZM1/E74btGDZLXC9ui9J72TgSYIT+lyUZOURUKLbY7Ds
 FvH6nWrMKYS4vJXcQun4gPAqw2QseO9vOaBYwJkXzCamffm5dKmzBu12jh0XfU9MgxV/
 ZzqDikx1vvMuPVB+SohchHxHDAx38RKOeCbefb6Fbhb7HOayo17w8RrprttJB3VRyWQE
 l4lpS1ueq2U0rwc01hs0Rico7n/BSlFnqvra/4+juFaA55dau+2YMuziFaTbi7PAgO/3
 5o0QfXpX/0vpUTaa+hTL8XoZNXJ0uTBgv53VNtKBL7i3OX9wsd1/daORtwdFpFiRjmb8
 pp+Q==
X-Gm-Message-State: AOJu0YxQyDAt3rOFLj6atg+/psa6OuXc4nybLSfole8GcgksIi8L3h4o
 hTA8iHldEV/ke9AGNghu+nB7uxpFBARZ1W/4zeJP+YvSloX26fMmCezD
X-Gm-Gg: ASbGncvjXg1jwj/m7ZXQdIBhji90lhAhmKS/RfMFS3R0eMtIcp40p4+eNc34CWZe/GG
 XRJKk0TcrqXLTlzc8JbHH9egZt97dLYU4R+gE1v1+mQplDMTxrb7gY/U4sQhVWXIz4rMzUwYWHy
 DQV+WFALXdVIsOHRWKFjRQEGksx1qYnFc1TGQVSSQBGWKE7zpV0iqQexL6MTLYnXIzuJi2dZ6w5
 xhbkb2mOZh9GlirMjO01AytWsqT6gNISRMP0ZU9YNFvt+Fhbmi0Rf4AxNRMAyQ7jHDnzdkEmNKm
 Tgc6MTdFGHV4sd+6PatLCLMtO14I/e2BfzRoxoIauYRPSR2/7pnJ+8BvEvuGafLISO4yghy1hJf
 g73ImNZkI04J3l8Uetrh+RpX/riNHBvHsOA/sG5zlFWZDWtv9+1PdAd/b4YacWrOBufXXWr4ZH6
 yQ6IbSJdAWjr9rzCaZELt8bpCdYzmf
X-Google-Smtp-Source: AGHT+IGSD5JKDCdaTTmAp0MYMS91XvkPp8oz/dP1zmqG4g5rPRzVgWr7fySwvEo5EuPqrlAAIl7B9Q==
X-Received: by 2002:a05:600c:4444:b0:46e:477a:f3dd with SMTP id
 5b1f17b1804b1-4775ce2878cmr4985525e9.36.1762285087353; 
 Tue, 04 Nov 2025 11:38:07 -0800 (PST)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775ce3ef38sm5549195e9.17.2025.11.04.11.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:38:07 -0800 (PST)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH v3 4/4] nova: Update the nova todo list
Date: Tue,  4 Nov 2025 20:37:51 +0100
Message-ID: <20251104193756.57726-4-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
References: <20251104193756.57726-1-delcastillodelarosadaniel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

This small patch updates the nova todo list to
remove some tasks that have been solved lately:
* COHA is solved in this patch series
* TRSM was solved recently [1]

[1] https://lore.kernel.org/rust-for-linux/DCEJ9SV4LBJL.11EUZVXX6EB9H@nvidia.com/

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index c55c7bedbfdf..35cc7c31d423 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -44,25 +44,6 @@ automatically generates the corresponding mappings between a value and a number.
 | Complexity: Beginner
 | Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
 
-Conversion from byte slices for types implementing FromBytes [TRSM]
--------------------------------------------------------------------
-
-We retrieve several structures from byte streams coming from the BIOS or loaded
-firmware. At the moment converting the bytes slice into the proper type require
-an inelegant `unsafe` operation; this will go away once `FromBytes` implements
-a proper `from_bytes` method.
-
-| Complexity: Beginner
-
-CoherentAllocation improvements [COHA]
---------------------------------------
-
-`CoherentAllocation` needs a safe way to write into the allocation, and to
-obtain slices within the allocation.
-
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
 Generic register abstraction [REGA]
 -----------------------------------
 
-- 
2.51.2

