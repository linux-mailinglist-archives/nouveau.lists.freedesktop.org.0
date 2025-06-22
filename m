Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA3AE2ED8
	for <lists+nouveau@lfdr.de>; Sun, 22 Jun 2025 10:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D778310E070;
	Sun, 22 Jun 2025 08:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eEFuntfM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914F810E070
 for <nouveau@lists.freedesktop.org>; Sun, 22 Jun 2025 08:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C09C4A363;
 Sun, 22 Jun 2025 08:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF98C4CEE3;
 Sun, 22 Jun 2025 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750579981;
 bh=kc6wH0RNf7tU2y9ol86aPp+PBkD6sFsqEFyyCBTJBME=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=eEFuntfMo6sPPQRtKqulNwC9lXTb19CPQ250nyQ/u9inIckkj5r1odEPWxEfvEe7G
 OBl+EIMXRszWfVeYwlgFIV1fwsxK04RVp6G2HSD+hEREcE2tnPufY+8o7VMpetoxY6
 uGaTxRTni7YAZ0RFlsZnvTmj6n1EJTPp0IiQ0uwHvaGn+XEbtMyG9CND/2zWpUVCGt
 w6is6jCyuY7d+/CqSeKxL3Ug9cPwVYrh0A6knNoChaXkOU8aDN+VBquzC0cX+LAJx3
 +w9lyG6AmPqEdinzJCRtjCJCVWTDSMo8YOFzaoKEsP1SWlXe+20OtVA6wwuHHxd5rz
 1I1kwhxulP4dQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 10:12:57 +0200
Message-Id: <DASWT7I119AY.1B0E7SCZYCZI3@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] rust: num: add the `last_set_bit` operation
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
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

On Fri Jun 20, 2025 at 3:14 PM CEST, Alexandre Courbot wrote:
> Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
> unsigned types.
>
> It is to be first used by the nova-core driver.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/num.rs | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
