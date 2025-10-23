Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2FCBAF64
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECD110EC95;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmPVfkkC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D28F10E940
 for <nouveau@lists.freedesktop.org>; Thu, 23 Oct 2025 20:52:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-63c0c9a408aso2135059a12.3
 for <nouveau@lists.freedesktop.org>; Thu, 23 Oct 2025 13:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761252719; x=1761857519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAPXNY+YzoexJ0d/TkSSgHS667VNidACYdJWMiQnzPM=;
 b=BmPVfkkCZ2026DLOXWANitdPpdgbQaLf1l4ds+a+7jYMVRQUcdQLwZxY/ugWkun9Eg
 uWnauuGoNL9T6Ux7LQgv8gZ3CiEtg/F7y9RVxCKwHZpjUHOGtqx7BUD9Xxw7sO3X9Vvq
 LaJtHDvwsGuteZdUiiS/3znnQlunCf41nrzaVipl41xAmF9ksNa4cWYMqZ3ZT0pt2JEQ
 D9gXiXEs3AoBJ5kZxbAXmqHj+U/XrtX50GZ93oPiR7ii9AWK116JXWgodjHKi/y2vfDv
 2VdrAB3P8U79n6FuMYjCOU409fTfehAT63wBfwSbWRjLFN05fwGExN4tVFfjFR0PchPM
 QoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761252719; x=1761857519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAPXNY+YzoexJ0d/TkSSgHS667VNidACYdJWMiQnzPM=;
 b=C/M7/21EXt3115EmAozCOOoGVX3bk2IDNU8xFjiLWZQmi8YDifi0Fs10EPRPLK4Nu+
 DcBeeV0FktJT+1wADT9As9Y6o3JMIl2B8WjEcmg+zMoNuaxIbAe89ipQa68+RTRoKU6e
 a7YGKIEDAYs+1Gs4L+Lw4y5tEc9u8c2AezmJr5kyp7yqhHaOBI9q+jI5XO6HS4Hw6Dk/
 P+CnGAAkSir2ixq/xL9ViOqmUyUFXdDcjGtZQTUN86iYn3v+fUJyqKnCtedc16srptcF
 4xBC5D8XAiAYmhbC/Gx05zwaM95iaxsxXQxEPzTySAH5bSReXAuCNJFuMVJ/BBmNBwnL
 GFrQ==
X-Gm-Message-State: AOJu0YxPK0H8ceUkFa6tv2VuVfgSF0iOhbB2sQM+T4TilhtQP+PcjuWE
 Ja7ICs0QZNosZMa70lO1GourP9DwqGzrk+yrcciqudsodxnnsqkiyIej
X-Gm-Gg: ASbGncuHd01016K6/RzMp3nWeASxI/N02KqSIlZeUI0wpsm1JE0tIRPJALkz2SLxs8J
 9pBVNQB5rywUia+u0+8c2PsBR2J1/T+776n0wMBwrzkZe3U1f2cbqvYXSh6gQ2K455FZINkLK/q
 LHHw4upJdHJRHuKmsvNERwF0uClnRGSSBR0+bFPlhvBjAIPf3kNX7z4a1IDQfiHklLMW7PFsiIo
 phUW4cZaAGfrPbwYVQGKo7ns6sON4WOZHu6Gs6yHO4LAp4llGaOuqc2vWRKMBc3s/rRGLH33T+6
 BRiVcxjq3btZFjFGHbZLT+t7d4b9cBbigahgbc4rh3KB+dfD148kNPCnj5swHN2EdssxssyGMdp
 FOaHShdQhQBrnFgjOkX5EPzOxoKR0MO82oPrSCDYqnX6OzxdjiM/RzcefXlP3pCasyxPkhtP0ZD
 5fOb0iSTnyu1SrW35m0w==
X-Google-Smtp-Source: AGHT+IFOkN+DkcmLNJzRNIqysto7sYM8LlsTGTSLlhGfULzr9KAi+B1XnIznbLvzFcpxukEGtb28dQ==
X-Received: by 2002:a05:6402:51d1:b0:63c:3efe:d996 with SMTP id
 4fb4d7f45d1cf-63c3efeee79mr22748502a12.20.1761252718877; 
 Thu, 23 Oct 2025 13:51:58 -0700 (PDT)
Received: from archito ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3ebb3299sm2564120a12.2.2025.10.23.13.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 13:51:58 -0700 (PDT)
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
Subject: [PATCH v2 3/3] nova: Update the nova todo list
Date: Thu, 23 Oct 2025 22:51:37 +0200
Message-ID: <20251023205146.196042-3-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
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
2.51.1

