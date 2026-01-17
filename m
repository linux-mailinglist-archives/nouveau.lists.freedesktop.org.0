Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F56D38E27
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 12:19:33 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2446510E0CB;
	Sat, 17 Jan 2026 11:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BYuMSjXE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9D02D44CB3;
	Sat, 17 Jan 2026 11:10:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768648254;
 b=ETeRMAqlYHph+Ia/q/yJxcpQuFJkFyCEMgFugLk3/TRqmfVLidxy16rQJANUjudq3xNLZ
 wwMcm5TwGrIRSvFT/QOqLQ3AMNyb/6pZ2CfR0U7p0b6IkCczEW0ru2Vf2a7x7zobDchK5nz
 AjN7E/UzgozzEABw+UZVMJ0rNUVS4db0cZGop3I1V/K90bw+VkPXxf1mOheGgAB8ZFJbIt+
 KTcTYA3h6Xm0hwdrbACpo8TQl+/ggI+eNYlDkjjVAO7Vpu+JXJasFU36i0kCZgvkRwhEhU2
 iu7RH845k36PnqtdYvehf2w1EmfU59lseD8jmtI8aMlxl2SfGQPGpd2lt3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768648254; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+8TdPPIYBhUDOUX4c4kW4fDt9pz4AvkUGUi3Bqh/Z5o=;
 b=aWQ/5jUAq3cZVhqfF0TqonoJHUb4Xb5ZIL7XG+UoYKEH5QSz+bDNqkBTFv/Qr9ZAq5lk0
 aVHiKwyWnrwqmJmxkmOYqM4lH1t4Psq6DH/Lx14tDV2Ew1/y2+29Pn+k65/FT+OSAMMd3T/
 Z7XHhnGa23w8E/nqfBQZP4tMF1UAAN70t4ngAvkrcmmubOQMAukwYsG9vmpy2LgmFUspJQI
 eu5DwjniVwKb7fASHkx3aYQhjWcWOrqt4wPKTabJH21rHT7+4qveg0moq7kuJ2wlRFzcwhc
 TaeX8X9v1hqWwHAoDcwPHNeQ+isKzpRLv0Rp0pWOrWqsj+X0kII8jPYAXYEA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C4CA444C5E
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:10:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2656710E081
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 11:19:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0F614041C;
	Sat, 17 Jan 2026 11:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A62C4CEF7;
	Sat, 17 Jan 2026 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648768;
	bh=fB7T6W9WSy/Dus3CVGYgcLzz7Jj4LHH2sIpcmY23ob0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=BYuMSjXEXi8nUfo/eWyB6QoP1ih+mWBxgI24P8d04YVEgPr8mBpcPuPJgvNuWSlqd
	 SsHdniX+Mtx2TxypWIgjd/JZoe3u0RNuJNlyzXqcn+1G6UD80mHKa/m908BJozDmZT
	 bC4bNWWuyZfgOYci7wYME7LiiFAJMOl66ITP6nBkMOz8zLMCoNLanp06vhoh0eT2g4
	 OFhzO/XSQCMpCxokpYpHeeMtIfMRCZkoSruzpwUbtVMDCSM7EwiqFndb5vSoflLrnZ
	 13Brw5I2FLjRDfURQPMae49HPt+/1tI3UPPXnEdo5LHb57xBJdQX04BgkTwe9XVRam
	 jbWRCkPYjChWg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:19:25 +0100
Message-Id: <DFQTNTW9TTG5.2M3A3W2GDOL9B@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com>
 <DFQTMWT0ZFOY.1EMLUIFZZ31OA@kernel.org>
In-Reply-To: <DFQTMWT0ZFOY.1EMLUIFZZ31OA@kernel.org>
Message-ID-Hash: KLLILODCXVIYOOZPFVPIXN5OVXK3DGU4
X-Message-ID-Hash: KLLILODCXVIYOOZPFVPIXN5OVXK3DGU4
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Matthew Maurer <mmaurer@google.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KLLILODCXVIYOOZPFVPIXN5OVXK3DGU4/>
Archived-At: 
 <https://lore.freedesktop.org/DFQTNTW9TTG5.2M3A3W2GDOL9B@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Really Cc: Alice :)

On Sat Jan 17, 2026 at 12:18 PM CET, Danilo Krummrich wrote:
> (Cc: Alice)
>
> Alice, for context, this is used when exporting a DMA buffer through debu=
gfs,
> while the DMA buffer may be in use by the device, i.e. no slice can be cr=
eated.
>
> On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
>> Add a new method to UserSliceWriter that copies data from a raw kernel
>> pointer to userspace, without requiring a Rust slice reference.
>>
>> The method takes:
>>   - data: raw pointer to the source buffer
>>   - len: total size of the source buffer (for bounds checking)
>>   - offset: byte offset into the source buffer to start copying from
>>   - count: number of bytes to copy
>>
>> The method is marked unsafe because the caller must ensure the pointer
>> is valid for the specified length and that the memory is not mutated
>> during the call.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> index f989539a31b4..8bbb0084abb1 100644
>> --- a/rust/kernel/uaccess.rs
>> +++ b/rust/kernel/uaccess.rs
>> @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Resul=
t {
>>          Ok(())
>>      }
>> =20
>> +    /// Writes raw data to this user pointer from a raw kernel pointer.
>> +    ///
>> +    /// This is similar to [`Self::write_slice`] but takes a raw pointe=
r instead of a slice,
>> +    /// along with a total buffer length, an offset into the that buffe=
r, and a count of bytes
>> +    /// to copy.
>> +    ///
>> +    /// Returns error if the offset+count exceeds the buffer size.
>> +    ///
>> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or=
 if the write goes out of
>> +    /// bounds of this [`UserSliceWriter`]. This call may modify the as=
sociated userspace slice
>> +    /// even if it returns an error.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `data` must point to a valid memory region of at least `len` =
bytes that remains allocated
>> +    ///   for the duration of this call.
>> +    ///
>> +    /// Note: Unlike [`Self::write_slice`], this method does not requir=
e exclusive access to the
>> +    /// source memory. The memory may be concurrently modified by other=
 threads or hardware (e.g.,
>> +    /// DMA buffers). In such cases, the copied data may be inconsisten=
t, but this does not cause
>> +    /// undefined behavior.
>> +    pub unsafe fn write_buffer(
>> +        &mut self,
>> +        data: *const u8,
>> +        len: usize,
>> +        offset: usize,
>> +        count: usize,
>> +    ) -> Result {
>
> Instead of this we could probably also add a safe method write_dma() that=
 takes
> a dma::CoherentAllocation<u8> instead. Once we have generic I/O in place,=
 this
> could be replaced with a generic write_io() method.

