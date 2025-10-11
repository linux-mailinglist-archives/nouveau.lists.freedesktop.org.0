Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315DBCF39B
	for <lists+nouveau@lfdr.de>; Sat, 11 Oct 2025 12:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D35210E15A;
	Sat, 11 Oct 2025 10:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LYDOZqYW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8EE10E15A
 for <nouveau@lists.freedesktop.org>; Sat, 11 Oct 2025 10:33:12 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-46e4fa584e7so15660725e9.0
 for <nouveau@lists.freedesktop.org>; Sat, 11 Oct 2025 03:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760178791; x=1760783591;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UEMAqpRvkk1CnOEEkWJ/ybbuyMvUoPKtuwUvs4qymvU=;
 b=LYDOZqYWINKcTlsBYvgSeWqchcm7az0R1nBc2o7/6Nuse8/Qh++4u3Tr8OVH8vEyiX
 bajqRy8ckEYM8FZN1wCyxLQNjB6+NT0J1xF/L0ruLXh1dScftDQs5DrmIh9qZdeHv48r
 +Ib/+xEUt2oYFwmHyzsNGyNuVi4GFlbLUXFYggsEvtcu9K3uOyjUseiUAs/E61zMWgv3
 2TwznGS8CkZ6Mk/x7jYIJQn6l+5tulqfH6Dok3kQ8aa/WexsCcY2ozjktY24oC6LjXgt
 HL5j/YxWA1r9KS5nP6SON30j77ET9UaJCtop2W/JNtkG+hcVL6+gpbVuSIIAOjVJWg/n
 HZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760178791; x=1760783591;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UEMAqpRvkk1CnOEEkWJ/ybbuyMvUoPKtuwUvs4qymvU=;
 b=X3GhFbJ48t+0oNzQA0zYgSB2g4rygAD9XYzxqNEtwZFQyJBTfyN6/QliX6M+pWDv8L
 7wj/2zN3gShEvXOwKC+TUTT0VCoCAAQkmrfQJi8JPJ+WurIUUqYhQiOkuXjN+DG8Zg3G
 IpLcezINkAWhlU3tAsYNYdbsSkwpLOUGQjdTStACRxntNJGubvqdaUwKx7kJwZW3OjIj
 lX/5BmRau0ubgSJgzBJOITIqLQxqX6Y8fJf0/nJfkZ63Y/zso02p+WbamDzZrG29AfBj
 fkClRAP+MCocoizml1lzsCe4AgPpNu06OSRJ4C7nIvnyAyYu1IlpZXLFPipXmDYFFxCY
 50bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaw2jgU9GXsCZEpjmTv5mznJ5A3PnsWknpZ8rw0vlK+v87zoP6GRROepZRE5HRJvCwz0cDgWBS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8459j0y7b+B2tsqcaquAwOCy3yMCYxlnBpOhWfs674IUPedTw
 2umgoRzRJaqC81AfZRtm0zd95zr0Go99A8yZaSLQeUkL2/1ktwTFh/J8zG3jNwA7FRIlRJ8NSR3
 X+rkzAjLWhdHfjXPteA==
X-Google-Smtp-Source: AGHT+IE95szyP/U8+8WhwLLID98VXllUKscYx6ym55wS0AieLc/ikoex6vLfoIyhhX1iRrMI6+QUlbXsF49wksQ=
X-Received: from wmcn2.prod.google.com ([2002:a05:600c:c0c2:b0:45f:28dd:87d9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:416b:b0:46e:3dc3:b645 with SMTP id
 5b1f17b1804b1-46fa9a87f3emr103546595e9.3.1760178791259; 
 Sat, 11 Oct 2025 03:33:11 -0700 (PDT)
Date: Sat, 11 Oct 2025 10:33:10 +0000
In-Reply-To: <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
Mime-Version: 1.0
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
Message-ID: <aOoySkWjPcJLVDrG@google.com>
Subject: Re: [PATCH RFC v2 2/3] rust: kernel: add bounded integer types
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Yury Norov <yury.norov@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Thu, Oct 09, 2025 at 09:37:09PM +0900, Alexandre Courbot wrote:
> Add the BoundedInt type, which restricts the number of bits allowed to
> be used in a given integer value. This is useful to carry guarantees
> when setting bitfields.
> 
> Alongside this type, many `From` and `TryFrom` implementations are
> provided to reduce friction when using with regular integer types. Proxy
> implementations of common integer traits are also provided.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

> +    pub const fn enlarge<const NEW_NUM_BITS: u32>(self) -> BoundedInt<T, NEW_NUM_BITS>
> +    where
> +        T: Boundable<NEW_NUM_BITS>,
> +        T: Copy,
> +    {
> +        build_assert!(NEW_NUM_BITS >= NUM_BITS);

This assertion can be evaluated in const context.

const {
    assert!(NEW_NUM_BITS >= NUM_BITS);
}

Alice
