Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355EECBAEA6
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F37010EC2C;
	Sat, 13 Dec 2025 12:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmF2zwOP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEDD10E641
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 18:03:40 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-77f605f22easo5718191b3a.2
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 11:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759255420; x=1759860220; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0kzqY2GXdADZuJoQ7BaFhRIAR3HFmpw/5lK4k+D6Ym4=;
 b=hmF2zwOP6rDE5G0pYhQT5hti8mE7NpIwVr5MkO2Ao9yvN3fJQKxwfBMHPU8uVVQ1nU
 yR6HoeoML1V8awLq3p5+LX2/oqwO3qBDrXv/aFNpfpKy5H0O+rwDI2EIrhCNm6gtQMBp
 Md3VfB3cOvV0iKOLjHp+ZeNq4xA7leOoXo60pJ9Jt7Zc5FEhqHn7bJd0b7y8ZPPCKuNt
 8vWyKjndxTbg7WyfBmh78GVTwwFwsbal9tQDaTALJeoU/IC5sDyaOI8fUId9FSy83q7n
 ijXmsQD8sD/Gqk471cE0rIBE281y7JkIt8vkcFp+OC93/L0i8Sbd0v93nlZVnq/CLzEJ
 EWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759255420; x=1759860220;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kzqY2GXdADZuJoQ7BaFhRIAR3HFmpw/5lK4k+D6Ym4=;
 b=DYYCCCFKUh/EmSjoJgjXpjNlUU5irZbHecejhNjXBpgSl/z8pf/oayblbhCODcBF/U
 JY5sLWf8yiGtacpbLdeL60JvXgYI7qoLqPSKde3eXQpr62DXqX5YMHFkUNVanpkBEEub
 R+hCzgBSQ1IckPW3vuDflR0u3F1igAqlb9d4LgSRvvw9oNgqrsGmOD33qaxGTTs/Xukv
 eYwqu3KsqONSdZcXWQy9fu0gtwpfY52CK7fYVDVYaPpmIwLudWejluEqJvU95Q6AAdkZ
 F3dLc16H8Vc/zDnHz15aDHpeKPzUmGvjxYiRPPHQP14lE/SOPKQiL9Y7UNC1WAXnVZdC
 vnHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnYQ5jqNZtAClaw+9YCygJLVWZ9onQa4cqcwZg+OUnTcNruloYEKlaXeur/NhXaxCTgOWyRnhm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNKSEweI2H1AS90fNB9bZ5Rn1bE/Z8WkXOdeLV7wnkecqd1KjL
 8Cf8FojjBsFmeskVhp6e+1ieIWS7q8/RhlGEZyAhYR6M0YLdCsnUpyaS
X-Gm-Gg: ASbGncvW5sm7VpzpzaWbwPDXkIFgyYV/qzRcUoJstIt+reeqrSXKYWT2H8Thz0WM/4u
 G3tuoaMOjOedneQC7iDxoRA0d3vMoMhuhBly4eR41s2TY1R4eZ8CGjA+wLV+L0tNg4DTvNiQGxA
 4iE+ZmYmogTLp6VhwIhzOipYO87i9Yi50T0pTzigZJ6PbKmCvpbN8sQ5T58l/Btv0BICdwfezcL
 wWhEUbFiOsXHfSY/DIdbfCUIQuUv73skcUyQnGB3M3rtfGTh08r4eZl9RMt/XKVs6CfEP+N3XUe
 MyFISc3zDnuK7E5Z7huQJF6zaAV6CGtPkSJJIFCyLwOb0+dAuLik8mSBgpeHA8ODrZRllHgR95k
 xbPLFNl8q+YwJyhRmFdH1jml8iGPDRoy0aNGO+o3qbe2H+K68WYVGqPuVIkewCaJdkb0=
X-Google-Smtp-Source: AGHT+IGlqklnb+3B8yX2mbys2RSKE1rUzSRhGovSCTwzJgtKy5reTE4M+Y3TOYyZYCHCr6FA4M71yg==
X-Received: by 2002:a05:6a20:6a1f:b0:2df:37cb:6b73 with SMTP id
 adf61e73a8af0-321d7f8c0cbmr788120637.11.1759255419738; 
 Tue, 30 Sep 2025 11:03:39 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c06fe8sm14239678b3a.77.2025.09.30.11.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 11:03:38 -0700 (PDT)
Date: Tue, 30 Sep 2025 14:03:37 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v5 8/9] rust: bitfield: Add hardening for out of bounds
 access
Message-ID: <aNwbeQ6iXuKIsQHK@yury>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-9-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930144537.3559207-9-joelagnelf@nvidia.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:49 +0000
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

On Tue, Sep 30, 2025 at 10:45:36AM -0400, Joel Fernandes wrote:
> Similar to bitmap.rs, add hardening to print errors or assert if the
> setter API is used to write out-of-bound values.
> 
> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  rust/kernel/bitfield.rs    | 32 +++++++++++++++++++++++++++++++-
>  security/Kconfig.hardening |  9 +++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index a74e6d45ecd3..655f940479f1 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -29,6 +29,20 @@ pub const fn into_raw(self) -> T {
>      }
>  }
>  
> +/// Assertion macro for bitfield
> +#[macro_export]
> +macro_rules! bitfield_assert {
> +    ($cond:expr, $($arg:tt)+) => {
> +        #[cfg(CONFIG_RUST_BITFIELD_HARDENED)]
> +        ::core::assert!($cond, $($arg)*);
> +
> +        #[cfg(not(CONFIG_RUST_BITFIELD_HARDENED))]
> +        if !($cond) {
> +            $crate::pr_err!($($arg)+);
> +        }
> +    }
> +}

Can you discuss performance implication? I'm OK if you decided to make
the check always on, but we need to understand the cost of it.

>  /// Bitfield macro definition.
>  /// Define a struct with accessors to access bits within an inner unsigned integer.
>  ///
> @@ -358,9 +372,25 @@ impl $name {
>          $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
>              const MASK: $storage = $name::[<$field:upper _MASK>];
>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> +            const BITS: u32 = ($hi - $lo + 1) as u32;
> +            const MAX_VALUE: $storage =
> +                if BITS >= (::core::mem::size_of::<$storage>() * 8) as u32 {

If BITS > storage then it should be a compile time error. Can you
elaborate under which condition this check makes sense, and is not
covered with the "(1<<BITS) - 1" case?

> +                    !0
> +                } else {
> +                    (1 << BITS) - 1
> +                };
> +
> +            // Check for overflow - value should fit within the field's bits.
>              // Here we are potentially narrowing value from a wider bit value
>              // to a narrower bit value. So we have to use `as` instead of `::from()`.

The new comment sounds opposite to the old one: if you check for
overflow, then there's no chance to "potentially narrow the value".

This "potentially" wording simply means undefined behavior.

> -            let val = ((value as $storage) << SHIFT) & MASK;
> +            let raw_field_value = value as $storage;
> +
> +            $crate::bitfield_assert!(
> +                raw_field_value <= MAX_VALUE,
> +                "value {} exceeds {} for a {} bit field", raw_field_value, MAX_VALUE, BITS
> +            );

Can you hide all the internals in the assertion function? Like:

            $crate::bitfield_set_assert!(bitfield, field, value, "your message", ...);

We don't need assertion implementation in the main function body.

> +
> +            let val = (raw_field_value << SHIFT) & MASK;
>              let new_val = (self.raw() & !MASK) | val;
>         all the internals in the assertion     self.0 = ::kernel::bitfield::BitfieldInternalStorage::from_raw(new_val);

User wants to set an inappropriate value, and you know that because
you just have tested for it. But here you're accepting a definitely
wrong request. This doesn't look right.

On previous rounds you said you can't fail in setter because that
would break the "chain of setters" design. I understand that, but I
think that it's more important to have a clear defensive API that
returns an error when people do wrong things.

So please either find a way to return an error from the setter, or
some other mechanism to abort erroneous request and notify the user.

This "chain of setters" thing looks weird to me as I already said. So
if it messes with a clear API, just drop it.

And to that extend,

        a = a.set_field1()

looks more questionable than just

        a.set_field1()

because it implies an extra copy. If I do 

        b = a.set_field1()

would it change the content of 'a'?

Can I do just 'a.set_field1()'? There's no such an example in your
test.

Is that 'a = a.set_field()' thing really a zero-cost comparing to just
'a.set_field()'? Can you ensure it holds, say, on 32-bit machine when
'a' is a 64-bit bitfield? Would it work if we decide to support
bitfields larger than 64-bit, like C does?

Thanks,
Yury

> diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> index 86f8768c63d4..e9fc6dcbd6c3 100644
> --- a/security/Kconfig.hardening
> +++ b/security/Kconfig.hardening
> @@ -265,6 +265,15 @@ config RUST_BITMAP_HARDENED
>  
>  	  If unsure, say N.
>  
> +config RUST_BITFIELD_HARDENED
> +	bool "Check integrity of bitfield Rust API"
> +	depends on RUST
> +	help
> +	  Enables additional assertions in the Rust Bitfield API to catch
> +	  values that exceed the bitfield bounds.
> +
> +	  If unsure, say N.
> +
>  config BUG_ON_DATA_CORRUPTION
>  	bool "Trigger a BUG when data corruption is detected"
>  	select LIST_HARDENED
> -- 
> 2.34.1
