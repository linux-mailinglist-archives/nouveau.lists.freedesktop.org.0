Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A040B48CC1
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 14:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F67710E4D5;
	Mon,  8 Sep 2025 12:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="puHaqcH0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898EA10E4D5
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 12:02:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D62444463;
 Mon,  8 Sep 2025 12:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C712C4CEF1;
 Mon,  8 Sep 2025 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757332963;
 bh=t11HIASYESpCmn8VJ3JPqOjRu5Sy8u7S1Z5peCBguj4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=puHaqcH0d6MVZCTWRU3QsJC6pmfMfMFLXdD+GCFwT/jPOm3+AN2voetfv+SiTRsOA
 1aBv0AqH1mDkJi8UcsxbAEk3j+bIkR+N1hy86Yw3h+sEOzWgICvutIpwkUDCw5IPIa
 77etmOXjQz0KEY3/18az6ZVkDdpVVoodinj9KUr7bGy8z9xU9xTKu5+xiTHe1s6hKs
 9tivJvDpCRTruX+UjE7Uq66WeasApBOQ0CF6rePFeESFrkKk1Eto3a6sNKLCUiNnas
 8WcvdBaMxHZSSQF7+Ut67rxPMdmJamPZfQYdFzJ+UW66Mupwx+hqKFDYOXe6JwkgZg
 22dd4CLDc1fag==
Message-ID: <c3e8e0fc-5582-49ce-99fe-6dea37c39ddb@kernel.org>
Date: Mon, 8 Sep 2025 14:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
 <20250821-num-v4-1-1f3a425d7244@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250821-num-v4-1-1f3a425d7244@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 8/21/25 2:42 PM, Alexandre Courbot wrote:
> +    /// Validates that `align` is a power of two at build-time, and returns an [`Alignment`] of the
> +    /// same value.
> +    ///
> +    /// A build error is triggered if `align` cannot be asserted to be a power of two.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// let v = Alignment::new(16);
> +    /// assert_eq!(v.as_usize(), 16);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn new(align: usize) -> Self {
> +        build_assert!(align.is_power_of_two());
> +
> +        // INVARIANT: `align` is a power of two.
> +        // SAFETY: `align` is a power of two, and thus non-zero.
> +        Self(unsafe { NonZero::new_unchecked(align) })
> +    }

For DmaMask::new() we used a const generic instead, which makes it more obvious
to the caller that the argument must be known at compile time. So, I'd prefer
this here as well.

Either way,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
