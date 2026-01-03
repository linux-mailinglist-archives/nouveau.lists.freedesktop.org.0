Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F69DCEFDF5
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 11:15:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB6BC10E339;
	Sat,  3 Jan 2026 10:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q8SBg0g4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 656A144C85;
	Sat,  3 Jan 2026 10:06:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767434817;
 b=ILseiT2Tg8AyokLPbByUzNuvgSJO0S5cnuV9P+qoffas4AT3zJyvHpPNn301fNL0xC++Q
 fOA40AuUdHQXXR7N23vnm3+Lcv3jVUl1EUB806ffvdTAcxZUvfca3E5vt2LDQHztIw7zUKb
 1zBlV9uH1id6Skf6ZbqgN2ZcF2BY5XUYKSOmx1IoYm9gkteZDpsh6AUxRlFJFWJKVipJypt
 lIxdu8sr3JfEd9OF6yAZ9t0Mtmlu02lJAyk/6vGf5SMLn8LjfveUlXhj0KXZG+Jo7lQvZGp
 yKTPoRAv8VAbq5uimi9zHyvrzqcMyoxwKO5B/GZYNiNu6iCT5zcoIMU9+UkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767434817; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WWJU8ERnzbQGjBij7dNj1wpHu+RXf7J4RlihnDr1vyc=;
 b=s/Y3LIKDu0yT6heJ5y7ueSBcneGd8baXcD3S2B80wME6zxgLW/CYMMdDre2NGPvCTv9Nv
 qWclMJUKq3N7Ux4zL3wwXNsquJ+NgHb9VijnYlc7NMp9wWlwXXy9TQ5PMC+9iS20h4YjgeM
 ZEJJ9S1jHD8Zf2mbg7E+0fVjWUuhUA7perHuXQRId8AmuqQQB39ETzfDluxKukIV4ufhnvf
 tnArd8zwLYLIhtEF5pwAeuOncMMYbSaLo4bUrKA6x4GhsKDBMpENXbPb0PbWBVYGIx22gAF
 K3vynLJLP2i6yMyjwqEm+Wu9zCrFNz7qtvjoqj4RAnFnLoIebOo2bK/AVMiQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A2A944141
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 10:06:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 32A4110E125;
	Sat,  3 Jan 2026 10:15:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D092A40D83;
	Sat,  3 Jan 2026 10:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D351AC113D0;
	Sat,  3 Jan 2026 10:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767435300;
	bh=VJPG6cAxntp719Jx+yOECXPqz1CSvBhPq9ajb2tyTX4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=q8SBg0g495DLKSAVqjx4MtrtLI/KWiCvW4GWkdFlpUw+/KIF7qSVpRVDR62wiZOJp
	 BlTgbdL/SAc88Bjz+53B3bzv9S+iRBg4Z/K14olgFfTnZ/fV2UWGTQDd7i92+CK9fQ
	 t4lJxSoqZ1ue0A0dey4+5+O0sc78U4lJ9xNYqE7XoFUkeFknWE2i/MpGoozjoAQU1V
	 akGoUm+0QeSU2kDSfmyILZx2Vgmmhb3e0AdFzs3hUUAnGxzdbmxhbcPYsL/5SyJUny
	 g5mW3D9LQzzyWchTzZ2ccldRVzF5yac7YIzjhioffJ2YaAiRu+GVTA6Z2ryXr0cXTY
	 k7LfN5J1ztzAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Jan 2026 11:14:55 +0100
Message-Id: <DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org>
Subject: Re: [PATCH v2 09/10] gpu: nova-core: simplify
 str_from_null_terminated
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-9-dc7b42586c04@nvidia.com>
 <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>
In-Reply-To: <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>
Message-ID-Hash: PJTREI4LNKPM4YYGYDVYJ2MQ2SYMKOXB
X-Message-ID-Hash: PJTREI4LNKPM4YYGYDVYJ2MQ2SYMKOXB
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PJTREI4LNKPM4YYGYDVYJ2MQ2SYMKOXB/>
Archived-At: 
 <https://lore.freedesktop.org/DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 3, 2026 at 4:37 AM CET, John Hubbard wrote:
> On 12/15/25 8:27 PM, Alexandre Courbot wrote:
>> The core library's `CStr` has a `from_bytes_until_nul` method that we
>> can leverage to simplify this function.
>>=20
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/util.rs | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.=
rs
>> index 8b2a4b99c55b..2cccbce78c14 100644
>> --- a/drivers/gpu/nova-core/util.rs
>> +++ b/drivers/gpu/nova-core/util.rs
>> @@ -2,15 +2,10 @@
>> =20
>>  /// Converts a null-terminated byte slice to a string, or `None` if the=
 array does not
>>  /// contains any null byte or contains invalid characters.
>> -///
>> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byte=
 can be anywhere in the
>> -/// slice, and not only in the last position.
>>  pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
>>      use core::ffi::CStr;
>> =20
>> -    bytes
>> -        .iter()
>> -        .position(|&b| b =3D=3D 0)
>> -        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=3Dnull=
_pos]).ok())
>> +    CStr::from_bytes_until_nul(bytes)
>> +        .ok()
>
> I guess I should have reviewed this patch, before creating my version of =
this.
> I went so far as to delete this file entirely, see if you prefer that, it=
's
> otherwise the same core idea, but with more cleanup. [1]
>
> [1] https://lore.kernel.org/20260103013438.247759-1-jhubbard@nvidia.com

Yes, let's remove str_from_null_terminated() entirely.

>>          .and_then(|cstr| cstr.to_str().ok())

Additionally, why do we return an Option here? While an error can only ever=
 happen if
the given slice does not contain any NULL byte, I don't see why we discard =
the
error code.
