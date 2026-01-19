Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD26D3A91D
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 13:39:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD04810E435;
	Mon, 19 Jan 2026 12:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sVu7QSFY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A235444CA1;
	Mon, 19 Jan 2026 12:30:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768825822;
 b=QfxTuankv8cimbDQLj8/PN7iMmT+ZYhlZdLqIfGF90kJxJBgE6I1BF73r1k8Ro44G3F7N
 RO6WasKvUlE0WDk/YQI2ZT6vztahtEFxkRW9e+84v8lCRUNDF/kuz/UwLOkrhdGrafbkid+
 kblaKHY9zXB5Jvpdh6Y6eD9rExtDJjiPzeVY3aNFGqFMHQffCQ71J2fCbqcOiObME7H0A81
 s3/tdsUP0P4G9sp21UgiXfaZCIP+5v8iFZ6jVNNt63FRVffiBmaGFE29hfgfnvJDO2gijQ5
 outnWDHeHf2uNPudgPWeUuZ2XPGERFG0tHR/204oiShuywY/t67V9KQ12D1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768825822; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v7Yg8tktGymoaZU+Kwc5FQfIwRrCfsx0XvpYphU7+gY=;
 b=Y5eGfofFipe68ubVJ3gNjSSOxPbF4tZs558+AmFrSuA/BMu8A59W7wLCY7DrZo7qhnF9y
 mrMl7KmvaTsbrcUj5dgKI4gHheLbedbX/qZqC/JNBM+27z0cjqhj2UOj66fwe0jG3LWu07J
 GkBqszvExMK7dTCFyfRT/rhAtqB7o32ygQzzRdWOD0AtocVEOeQ2sqVpaO2WUG1EO0v+7a8
 vxUi7QiqqDi1Y+lRxIBh7OAa/Gyfn0M3mDVwI4dkjb3qvQKJnwmVTqZ84fZr3TFOBvKF/hH
 e3IJyD7hQ+9Emv0z9dRJbAc8nwvZvpjYyeUtvN6kNeG5mRM0NP1Wv+g01KEQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 85A02404B2
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 12:30:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72E2B10E432
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 12:39:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65C8F4039E;
	Mon, 19 Jan 2026 12:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F2FC116C6;
	Mon, 19 Jan 2026 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826341;
	bh=arAi38nJkadXyPRr0fJ12sZFQzJWjy+451u08njCcY0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=sVu7QSFYPvyLRg7UrRGkxJd1Tb4MoW9OUw9cKNRNU9AZMz4JgfdYn92lF84IIBPZp
	 SSlzsejx8HY7v4ML4M32GAKdVA329c5Q11dTjOUQzaTw9Dm8v5KshWCgchAuJ2UKZk
	 6nODMBxSJztdPywwvrTMT2Pu4oou/Mddash0rh/6qSX/sjMJUoEueEPp17e2vgqNtZ
	 0Y/5r2NoWgSynzCeCyS6ibr5/IXZ0Bf5iDHPrY/4k9AtTmTZJXHbWre3TBd39FRkaJ
	 f6y8ORpVysQT+mUDHDglaiYfDKonWwv3NFMlr9hzCWaoxbGzd6ur+XeGq+8d5bLOJr
	 WsF6umjoZuQaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 13:38:58 +0100
Message-Id: <DFSKLTVPNQ11.26N3WVT559F22@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com> <aWuNbUywGRH1zo-0@google.com>
 <aWubWE4kstGI42P9@google.com> <DFQXTQJSCXV5.2FSUVMTSF2OB3@kernel.org>
 <DFSK2KHCXTIB.3RR5Q81ADGKRR@garyguo.net>
In-Reply-To: <DFSK2KHCXTIB.3RR5Q81ADGKRR@garyguo.net>
Message-ID-Hash: 7QNWP3EQXGKIE6JTL6PF4JSOB2ALBCVF
X-Message-ID-Hash: 7QNWP3EQXGKIE6JTL6PF4JSOB2ALBCVF
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7QNWP3EQXGKIE6JTL6PF4JSOB2ALBCVF/>
Archived-At: 
 <https://lore.freedesktop.org/DFSKLTVPNQ11.26N3WVT559F22@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jan 19, 2026 at 1:13 PM CET, Gary Guo wrote:
> On Sat Jan 17, 2026 at 2:35 PM GMT, Danilo Krummrich wrote:
>> On Sat Jan 17, 2026 at 3:23 PM CET, Alice Ryhl wrote:
>>> On Sat, Jan 17, 2026 at 01:23:57PM +0000, Alice Ryhl wrote:
>>>> On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
>>>> > +    pub unsafe fn write_buffer(
>>>> > +        &mut self,
>>>> > +        data: *const u8,
>>>> > +        len: usize,
>>>> > +        offset: usize,
>>>> > +        count: usize,
>>>> > +    ) -> Result {
>>>>=20
>>>> Why not this signature?
>>>>=20
>>>> 	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;
>>>>=20
>>>> You can implement `write_slice` in terms of it.
>>>
>>> To clarify, I think this would be a simpler signature for
>>> `write_buffer()`. And `write_raw_slice()` can be used both for DMA and
>>> to simplify the existing `write_slice`.
>>
>> I.e. you can use it also to create a safe helper for DMA:
>>
>> 	fn write_dma(
>> 	    &mut self,
>> 	    data: &dma::CoherentAllocation<u8>,
>> 	    offset: usize,
>> 	    count: usize
>> 	) -> Result;
>
> Would it make sense to expose a `&CoherentAllocation<u8>` -> `&[Atomic<u8=
>]`
> conversion method and have a `write_slice(&mut self, data: &[Atomic<[u8]>=
)` for
> `UserSliceWriter`?

But we don't need any atomic operations for this. Maybe a transparent new t=
ype
that only allows access with {read,write}_volatile(), or maybe an UnsafeSli=
ce
type that can provide accessors that internally use *mut [u8] with
{read,write}_volatile().

But for this problem we only need something to eventually pass to
write_slice_raw() which will just use copy_to_user(), so it might be orthog=
onal.
