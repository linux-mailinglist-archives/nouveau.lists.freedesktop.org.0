Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CD2D38F21
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 15:36:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49F2E10E182;
	Sat, 17 Jan 2026 14:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I1/CLjYn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6B27544CA7;
	Sat, 17 Jan 2026 14:27:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768660052;
 b=FqO66i+259QDSis8tVWYl+SwX9xzFNLeV6J8MF5yZwm8/0UfNR9yucoJ2U3P5hlmStmls
 1/JnR/w9o7wkFhZ2kNoLrl4vFOgSW7VixZgfraWSRhICmxTmCeqef47OjJVHFZgX+/NCagS
 rcOzZ8khBB7FWpvei4MFfS2v4a3WA9ShCuCDBFi9DhOV2XQ/z5R0/uzsGAapqYWDpe15b5m
 K4Z815XVT/Q003m3LvXEWJhzmI7jWr3d3D2E2fdvEvNGBtlu5qItaSB9vtcPU//TrzM+Uja
 sgBuIhpYNL0VOehNtoaAUhQA2hWctqgydUUdmApXcw6Uk5H0X7kLmtSVAjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768660052; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=asAz/+g8aSRoH69xhwxxqJIeEXZSwIKUMG1jwBCLmpw=;
 b=IP5V7ZeyFzdiMEJSg+3FHpwcjUuMi+pV8mHzem8MGqt+J03IoN4yTXQMJh7cSG3+iPB+j
 t1385x/eZ6T5hf/9Q3mBE9GXYfrNAKSDdi+jYoUa8+MDXJHZ0pg7tyuk5d58kumV81nDPET
 tjm2ZqaBJ/v0B8a8xrgEXx8B7cXjXWZvaZK9hA5eG4Lf4oO1B7UBsfFCA1jB0G4jukY0Bq1
 9qN4WSf4C9epf/+e6+iYlvHBBpTb03HTY+LQkwzVFIFI2PMg8/zlYyEYbflCQmPre0XYADy
 d1OwkC90PpdND5pqnZyxgZfKh+NQsRKjNxRJTWRi+1RNJ8yRJSwUMydRLUNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2B2D444C3E
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 14:27:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C08AC10E0C9
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 14:35:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4DC360127;
	Sat, 17 Jan 2026 14:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FE3C4CEF7;
	Sat, 17 Jan 2026 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768660516;
	bh=3McJbgRsgFufQhosw7AviBNc4LDGUtbjIfgDRPmgZI0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=I1/CLjYn6LdnoSzHtqBKCtuzNL437lz5rM3gUVOCgf7f5qbtSlzQgzNbgJeQAQUNf
	 ug5zOR81KD7uAC5Tp8ee2lS1EvDm6AIDC6J7tifWIFcDu9CIpbp81+ITVb46F5Mo3K
	 xWBylcnL6DBjUmhOmn7VkciczcfJmOAbSRzCydXzPqies9zA/a3WmmNchw5ekvNAee
	 SfniDP3ce5QvIF8+e4ZVmaGYmgSfyyXl7RLXOSn+UG1eF0fk3RBvelbhK+JENe/NvL
	 fsEx7aTPiGF1vJ+oq1VqfV4g3NIqD4jGULlY+WrZ2MKDcQIpqyny7B2GRJquFEj0NJ
	 Jq+zqIXbicNVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 15:35:12 +0100
Message-Id: <DFQXTQJSCXV5.2FSUVMTSF2OB3@kernel.org>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com> <aWuNbUywGRH1zo-0@google.com>
 <aWubWE4kstGI42P9@google.com>
In-Reply-To: <aWubWE4kstGI42P9@google.com>
Message-ID-Hash: ECTXYSDDTK5QQEW6MZJZEXTPGJUZKZBZ
X-Message-ID-Hash: ECTXYSDDTK5QQEW6MZJZEXTPGJUZKZBZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ECTXYSDDTK5QQEW6MZJZEXTPGJUZKZBZ/>
Archived-At: 
 <https://lore.freedesktop.org/DFQXTQJSCXV5.2FSUVMTSF2OB3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 17, 2026 at 3:23 PM CET, Alice Ryhl wrote:
> On Sat, Jan 17, 2026 at 01:23:57PM +0000, Alice Ryhl wrote:
>> On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
>> > +    pub unsafe fn write_buffer(
>> > +        &mut self,
>> > +        data: *const u8,
>> > +        len: usize,
>> > +        offset: usize,
>> > +        count: usize,
>> > +    ) -> Result {
>>=20
>> Why not this signature?
>>=20
>> 	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;
>>=20
>> You can implement `write_slice` in terms of it.
>
> To clarify, I think this would be a simpler signature for
> `write_buffer()`. And `write_raw_slice()` can be used both for DMA and
> to simplify the existing `write_slice`.

I.e. you can use it also to create a safe helper for DMA:

	fn write_dma(
	    &mut self,
	    data: &dma::CoherentAllocation<u8>,
	    offset: usize,
	    count: usize
	) -> Result;
