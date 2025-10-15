Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2FCBADFD
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7203D10EBA9;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rexpznn2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31AC10E279
 for <nouveau@lists.freedesktop.org>; Wed, 15 Oct 2025 19:50:38 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso1335095f8f.0
 for <nouveau@lists.freedesktop.org>; Wed, 15 Oct 2025 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760557837; x=1761162637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFRVqaDMnH4SBXpwWtqNUxjwC6dLm5pDnJjbqzI+Vnc=;
 b=Rexpznn2VrLmdLwro2dbIjc+EXI3i8cAdqGyfjXrvKu9FvqAA8kt3luhn0wKKgZIt3
 99jaUU1jX+NDkhYLzRtIwwJRL13UWABoijb1RMv1KvbDvoBFrjOXb8e9Vccg1xo+6qkf
 8lwAVwhsYuQquoq68N4jALSZBLR9/9HmXo8w87jeOp55NedLQ6gcTiUMDvUu//s6kT88
 8GQsyUAs3ErwIXJBH0Yo0EstNRBRSsW6D8Y6K2s3x3c6xLuQiCHd0YXU3YeccWd9u7bp
 E5+ufzRcwaic9OTjvvn6AZxuV2eQov2VNkWXaDfPkIGmgyB0Yq024ol2mqw0YHqoqkZy
 EBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760557837; x=1761162637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFRVqaDMnH4SBXpwWtqNUxjwC6dLm5pDnJjbqzI+Vnc=;
 b=juTHNGTU2zLV1QATOFsPDf60MU5ifDjn5/o7o+wcW/ddztKdhVheCJqJ7dYVdoJ99Z
 H6YznDflXYrYg0YXmFawqFyCukn6c4G1uQbapDsQuC1DeKKuEGhRC2dEYxMMFLiSXPVf
 Fq9ZbUqTypZmpvzQnidtKvg5dIJu94nXJ7SjBZOCnZKHMZVzOb/Lgh0/pE5wx+CxFxKq
 NudEFX/jexrr8VEpynliWF+7BG+fTlZdLhgN8VK5XRZNMnQMIiCFBrNb72vLPD2CXm3V
 ZTPW5Ikglg134E1RIHa0RnpN8dR56HK5wRGa1W0sTCV0o9Evs/0pThnvqjhC5D7ttWYe
 r0Qg==
X-Gm-Message-State: AOJu0Yx19Lk+wtW86AzPwg050Lfo8kpZyqUhZu94pQZ7QWMb0lBKqQlV
 qxNf0dwg6C60Dp5mTD0Uoj4ZQR0s/Bh7ns0QfRfPw6XMDdQosgcbMYLt
X-Gm-Gg: ASbGncuTuGI1WlKlvCcZCzbwVMEtg1qR13rVR44yaZrD0NNIfizUz98IJgX9ZhsW9jO
 AIG/F+qjZ6CK3WI85lddZFNzf55GOd6aiCDoC03hZlSo5BGiQNPktoUaYCmDv5xL/IS4GD5HVlL
 4x8J++iBs32uMM+VRo7swnBVAY3JY/QLM/3TPvA8kXIpg2+OHT90UQEnCL2lKsaKs+UNObaJ9yn
 cELrzaENwdpxPkHb2uMua70HVNasdC6UebY5kmGBviRITCCpuSUKBvJGy4lgXF6M+T7PSzo4y85
 EJ7+JLMZGe5ZLvMw6zteIsx/y1RqwEiUTnKxIf/o9ZxXQ2bk1+h+raLNYnucY5AAnLUQVm2Zf/R
 WlITlkoaI7auS6J8N9R1fWMVHq40Fh1FtyoMGz/wRKqNTwEDDPvTtveRW+0Yihex/wvLBS6NOYa
 jzXn3bR95dvmeVLHE=
X-Google-Smtp-Source: AGHT+IFewXtBswgFkJ+PxuKCQAic+eavwTJGRRYaxnccnJwiMsIC69bQdFW+noWi4hvllo/GJsJtPQ==
X-Received: by 2002:a05:6000:40db:b0:3ec:42f9:953e with SMTP id
 ffacd0b85a97d-426fb6a7131mr971099f8f.7.1760557837106; 
 Wed, 15 Oct 2025 12:50:37 -0700 (PDT)
Received: from archito.cern.ch ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc155143fsm281464675e9.11.2025.10.15.12.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:50:36 -0700 (PDT)
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
Subject: [PATCH 2/2] Update the nova todo list
Date: Wed, 15 Oct 2025 21:49:36 +0200
Message-ID: <20251015194936.121586-2-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
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
remove some tasks that have been solved lately.

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 48b20656dcb1..be8063030d44 100644
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
2.51.0

