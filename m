Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754D5B310F1
	for <lists+nouveau@lfdr.de>; Fri, 22 Aug 2025 09:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A11210EA82;
	Fri, 22 Aug 2025 07:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ycjii4rk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E707A10E0C7
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 07:59:00 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3c630eea496so216698f8f.2
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755849539; x=1756454339;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OcR2vTnWvdHWsTxe8C4S1nf6KTHkxOneetmft7WPD4M=;
 b=Ycjii4rkpC+34zVuqlui96UhzgC8OLGiTlD7b67T6ThSMouDXTQEITN4Zx6OEyNIah
 p2VILLWbTAkVzCkeLOug093JYJk8kpdz3pCrl+H+DBJwn/HSLikATfNLZ5SZIRCYIM+o
 UjLFi0P/73rJBo4Wvz3uhNIaWWFcrr3kBKRl7WxanH8SmPgOMQBOdFZ4siZyF+BQDtML
 +ZETJQQeq8UYWj5hgfm0TGlehZXrAJIoBsnG5ZKn2ueJDmryJNruZFFuA96VM2iF2Zls
 IFoBoq2VRJ0sWrU5gwJ53F9Y9CP9XqhMQx7fvX0+yBrKWJthRa0EMlcIkSGfleD2qJ9u
 6AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755849539; x=1756454339;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OcR2vTnWvdHWsTxe8C4S1nf6KTHkxOneetmft7WPD4M=;
 b=ovpoJCKk+olTcsq1ZC2aefMNif2FcZ7DkYLXw19KJGhTxNeqFL1pcaNUUTqj3nXnnP
 yNO/POtVXisb9SSSVx6AVPNSdTVZPCb9s6FXS5ms4Mz3mJRcO+UhmVWC00exO3NhNRps
 4cR/i8BJD3CbxRCH3QgQRwnkAdw5w8nS2kL4GuBjAFl8WOynTlUfCzljZ2MF4tEUWwQR
 tXYcoEFG2mTshP9Wa7Js+ey+xux6YOy43JvattN6ZwRPm8x++ntpT/2n40aKPa2qwNjS
 nRyGB2mGGt7nwe8rtD6ma2mgO5Z6VGSmXoOHgMp9uVdGGy+L5m91fc0XDqRy6o9VJiuB
 W3yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDV+IBectX9qfAH+BykEnf304ATmF0jarf+MuMDXw2dJln82hpQJ7/7ndFsC6GU9ehSCRZ77Vx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqlU8siSQX99pjWtX3xmkt7ib3taTdwBpQraPzGYMGVCFIsiKR
 1XubWO8A1TQn1bYEna7dKL9zHXYkPX7LrGx+uo9EPoQlrSrmupfcATi2U+dzlPnYbQ/tIAzjhDw
 9kVOfbiBzAn/DHHYTPQ==
X-Google-Smtp-Source: AGHT+IHHa6Gwb6EMwcReUb8w20SMBOY8HUqXKfoIIJGVFOjuon7/sYmIEhsZh0RUa04bS92rGVC4oCZ2kKrrErU=
X-Received: from wmbdv11.prod.google.com
 ([2002:a05:600c:620b:b0:459:dac7:4ea6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2583:b0:3b8:d893:524c with SMTP id
 ffacd0b85a97d-3c5dcdfb74cmr1360982f8f.53.1755849539448; 
 Fri, 22 Aug 2025 00:58:59 -0700 (PDT)
Date: Fri, 22 Aug 2025 07:58:58 +0000
In-Reply-To: <20250821-num-v4-1-1f3a425d7244@nvidia.com>
Mime-Version: 1.0
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
 <20250821-num-v4-1-1f3a425d7244@nvidia.com>
Message-ID: <aKgjQq9tfRuCq-cr@google.com>
Subject: Re: [PATCH v4 1/2] rust: add `Alignment` type
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
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

On Thu, Aug 21, 2025 at 09:42:17PM +0900, Alexandre Courbot wrote:
> Alignment operations are very common in the kernel. Since they are
> always performed using a power-of-two value, enforcing this invariant
> through a dedicated type leads to fewer bugs and can improve the
> generated code.
> 
> Introduce the `Alignment` type, inspired by the nightly Rust type of the
> same name and providing the same interface, and a new `Alignable` trait
> allowing unsigned integers to be aligned up or down.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
