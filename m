Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D594D38E22
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 12:18:22 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C08A410E0C4;
	Sat, 17 Jan 2026 11:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p4W5icmm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3F3E444CAB;
	Sat, 17 Jan 2026 11:09:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768648183;
 b=UA/VHufYlNEZjj/5Osk7qy7FY1hSgnuouEgiJTnbEiSjNDY4vSm6CSLP50i+LFvYehcC/
 /Sx5rwtE+Wa/kGsUp5Ag3T5nLOnXh90O/6bsE66bFVdEjGK/rXJsbEqIbaXAQ+o1qptE8Pt
 VTLwDGPwMGr+oae70REJoIt3qR8NO5GvRsCF2vlwwf6BUC8/nlVEiaslzobkybwd5iXh7t8
 soUjvtt2rm56gyr5Y0GIr0AdJtCLqFZvN8FJr3JdwviLww7zaI4+ld+4UoRoNeHk9Pf2CR7
 hLC3GC3SjcsHEkRICMbjn/XACN64u+Ke8A18W3wJsHiCbaLQxsp4r1C4WVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768648183; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=p26Yhg/JCHwTIrhxRbf+xc9SZl8jXf+4Xw2Zd8IeCQ0=;
 b=eindTkDCbPuwmJpLZwJhYGDzN8USVkQ4I+8wHoQ2LF2L0frqsdNscvYDQ8INhx9ubkOr0
 aF+xSgactBi7BL83KTSKah9Yl//v12df2BGPOnlhu0mKeK2skBD6VjwJoIsvOJxRVnHuacD
 90Yevzi5V4jecbwU09PjlJ3NDEvQaeC4iwBOL6jEhMzNIuw1mMlpvvxLGJdIAgqDvLrKwAL
 ssTAH85GFUrtJZkiAiOPzYNgwyh+4nYSNPAs6HLXuSUY9McV588cukg4o/ZvsvqFSsM5ApX
 1ZxAHSMnaPJH8sGaXasZNdKwq1V9aUCnUk6oOK2jyimA8BjIiF1xJCpsoDNg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5EE4E44C5E
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:09:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9611310E081
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:18:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7FA260131;
	Sat, 17 Jan 2026 11:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0235CC4CEF7;
	Sat, 17 Jan 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648696;
	bh=r8pFE19enbEpY7dhMp0/C2AB6nWk5mDSkT6a80RWyqI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=p4W5icmmAKGZxgj0llhic9EJcPcciAHWRUgg2ptPSvqsDsCEdphtvZcB2aL0CD4V1
	 hlXryIpiW8W3O77m/jBm+bG57x7ds0iv3npPjWknrv/l9a9xIvr1NKUrhrGf9boLOb
	 WWRgsI6eMZ2f6USU5DAA+tJs3t+AThIYd5mRP6nXlDysYSa1q9hHODMnr4VQgEqusj
	 Yce7DgoEfgXXYsXvNccdy6CgHqIoEwGH5jX2raFKh+IVZxP76SEgXgIpOCgQ1MuXkO
	 rG/zRSNZHBfwZKedeQ0XSNIAlFn8zJnr5BzCj295r6QeaFmQJDP/LnF3zzx+O0/Yvd
	 oooLk9R+v6OiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:18:13 +0100
Message-Id: <DFQTMWT0ZFOY.1EMLUIFZZ31OA@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-4-ttabi@nvidia.com>
Message-ID-Hash: RSREDP32EXAV2AKP32TLLUJRIIYZXSAH
X-Message-ID-Hash: RSREDP32EXAV2AKP32TLLUJRIIYZXSAH
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Matthew Maurer <mmaurer@google.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RSREDP32EXAV2AKP32TLLUJRIIYZXSAH/>
Archived-At: 
 <https://lore.freedesktop.org/DFQTMWT0ZFOY.1EMLUIFZZ31OA@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: Alice)

Alice, for context, this is used when exporting a DMA buffer through debugf=
s,
while the DMA buffer may be in use by the device, i.e. no slice can be crea=
ted.

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Add a new method to UserSliceWriter that copies data from a raw kernel
> pointer to userspace, without requiring a Rust slice reference.
>
> The method takes:
>   - data: raw pointer to the source buffer
>   - len: total size of the source buffer (for bounds checking)
>   - offset: byte offset into the source buffer to start copying from
>   - count: number of bytes to copy
>
> The method is marked unsafe because the caller must ensure the pointer
> is valid for the specified length and that the memory is not mutated
> during the call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..8bbb0084abb1 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result=
 {
>          Ok(())
>      }
> =20
> +    /// Writes raw data to this user pointer from a raw kernel pointer.
> +    ///
> +    /// This is similar to [`Self::write_slice`] but takes a raw pointer=
 instead of a slice,
> +    /// along with a total buffer length, an offset into the that buffer=
, and a count of bytes
> +    /// to copy.
> +    ///
> +    /// Returns error if the offset+count exceeds the buffer size.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice
> +    /// even if it returns an error.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `data` must point to a valid memory region of at least `len` b=
ytes that remains allocated
> +    ///   for the duration of this call.
> +    ///
> +    /// Note: Unlike [`Self::write_slice`], this method does not require=
 exclusive access to the
> +    /// source memory. The memory may be concurrently modified by other =
threads or hardware (e.g.,
> +    /// DMA buffers). In such cases, the copied data may be inconsistent=
, but this does not cause
> +    /// undefined behavior.
> +    pub unsafe fn write_buffer(
> +        &mut self,
> +        data: *const u8,
> +        len: usize,
> +        offset: usize,
> +        count: usize,
> +    ) -> Result {

Instead of this we could probably also add a safe method write_dma() that t=
akes
a dma::CoherentAllocation<u8> instead. Once we have generic I/O in place, t=
his
could be replaced with a generic write_io() method.
