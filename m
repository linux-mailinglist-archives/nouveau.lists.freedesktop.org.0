Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6DCF0CF0
	for <lists+nouveau@lfdr.de>; Sun, 04 Jan 2026 11:40:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF7B010E186;
	Sun,  4 Jan 2026 10:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ik.me header.i=@ik.me header.b="4iuCzjTQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 482F844C8A;
	Sun,  4 Jan 2026 10:32:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767522729;
 b=ta9VZJYa0NItgKLwi/1Y25qRF5Ujy/vJ5Tfhqbl8aHDGFRFEKvd54p2Hj60mAQRU6c7KI
 HkXELw7Wnc6TUuscEklOAxV/358hIuET13MHqu++l9G40NS+O66zQTTmpn3YH3Fsn8UPbkq
 PA1L8l+YNmzqj87aBbitgxHdz115xicWoGhFdQnZ2AADskTRmtCFvCXTJv6yNjioHqYMOix
 CJcrwMPubOVtIn6aZ+xFIN5V60ke0Hq6Iu3xqWcRhq5Y+jYBRVHRlK/mfRC9XzdWtVsQWiz
 zge4O2ujPcjiBzFelWKZ1Hy9i3TOPrN57itnGWZh9YHF85VsG3zl7vWqhnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767522729; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=E3pWE0rXz5wnnhUWZBYF0n1WK9DqOL4J+vu67+IxT+w=;
 b=DMZyXsFUemgrlMqGsqQl8sY4mQyI9SOYtV7dPoIOM/Ck1r/HM9GwUDhYyQIOKd0D3VOxc
 r74IDxHuDKUqJ7fztra/ifjXFZjAWGp9JPfltvTUgUWmJTNUrJKGENAe8tXgpsXMaLkCHht
 19c2TX6DpsF3DXmUj2aWoQgzBdwP8Kzc+3GV9/O5loD5rqpuhYvZRgu0XrIk6yrorOLT6+v
 ZWTW1LaFyBx0+1BoFVHpifIRx+pZ/FKTWKTKf00I7TpzU0I+uEHPXkTkCdKTml4OmF8uAne
 2+VLzpqESRZBeW4Q/3YaRBWUUMwh6RpzL2nTgMZ2nrbi1aLwKcQiOT8jALhg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ik.me;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ik.me;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 800EE446B7
	for <nouveau@lists.freedesktop.org>; Sun,  4 Jan 2026 10:32:05 +0000 (UTC)
X-Greylist: delayed 1103 seconds by postgrey-1.36 at gabe;
 Sun, 04 Jan 2026 10:40:12 UTC
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch
 [84.16.66.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7999010E025
	for <nouveau@lists.freedesktop.org>; Sun,  4 Jan 2026 10:40:12 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dkYPl0j04zqc4;
	Sun,  4 Jan 2026 11:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1767522106; bh=E3pWE0rXz5wnnhUWZBYF0n1WK9DqOL4J+vu67+IxT+w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=4iuCzjTQw9OcpBOlkFWXj/C2H3pmBVxzn16uD36c/0ViNmng+yVHU7/+NIgY+TY+7
	 9ZJbHyRWOdgeaaX62K0BMO4DHpVSSPqaMnFDXrQD3SOgH8hDgDRx6W1434yLMYbwGb
	 il4su4J/ZCOg944XBdUZmnu1hnV8IJLYPLIXENcU=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4dkYPk0vYPzTNq;
	Sun,  4 Jan 2026 11:21:46 +0100 (CET)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 Jan 2026 11:21:45 +0100
Message-Id: <DFFQALP7EVRX.TFWUBO31C9IH@ik.me>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Timur Tabi" <ttabi@nvidia.com>, "ewan.chorynski@ik.me"
 <ewan.chorynski@ik.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.21.0
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <DFA1CUMND2ME.1D3PAJW641QHM@ik.me>
 <802504957624510a92a4b028a2d5c4d41f1ee6e1.camel@nvidia.com>
In-Reply-To: <802504957624510a92a4b028a2d5c4d41f1ee6e1.camel@nvidia.com>
Feedback-ID: :52330b22a40e583:ham:e74197f626dda86
X-Infomaniak-Routing: alpha
Message-ID-Hash: XK4STHQ37LLM2UTJOLIXWULZULVMKWOY
X-Message-ID-Hash: XK4STHQ37LLM2UTJOLIXWULZULVMKWOY
X-MailFrom: ewan.chorynski@ik.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XK4STHQ37LLM2UTJOLIXWULZULVMKWOY/>
Archived-At: <https://lore.freedesktop.org/DFFQALP7EVRX.TFWUBO31C9IH@ik.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 30, 2025 at 10:42 PM CET, Timur Tabi wrote:
> On Sun, 2025-12-28 at 18:45 +0100, Ewan Chorynski wrote:
>>=20
>> [=C2=A0=C2=A0=C2=A0 3.623000] NovaCore 0000:01:00.0: GSP MBOX0: 0xffffe0=
00, MBOX1: 0x0
>> [=C2=A0=C2=A0=C2=A0 3.623026] NovaCore 0000:01:00.0: Using SEC2 to load =
and run the booter_load firmware...
>> [=C2=A0=C2=A0=C2=A0 3.626236] NovaCore 0000:01:00.0: SEC2 MBOX0: 0x31, M=
BOX10x0
>> [=C2=A0=C2=A0=C2=A0 3.626265] NovaCore 0000:01:00.0: Booter-load failed =
with error 0x31
>>=20
>> Is this expected to happen ? Here is the full device description from
>> lspci :
>>=20
>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GT=
X 1650 Mobile / Max-Q]
>> (rev a1)
>
> This should work on your GPU with my patches.  Error 0x31 is a generic fa=
ilure error code that
> indicates that booter_load failed to initialize, and that could be for an=
y number of reasons.=20
> Unfortunately, the only way I've been able to debug such issues is to rep=
roduce them in-house with a
> custom build of booter_load.
>
> I suggest that for now, you hold off until these commits are merged, alon=
g with my debugfs patches,
> and then I can try to find a similar GPU internally that exhibits the fai=
lure and see if there's
> something else missing.  Turing is the most complicated of all GSP-capabl=
e GPUs to boot, partly
> because the firmware does a terrible job of reporting errors.
>
> I'm assuming that Nouveau boots just fine with the same firmware images? =
 If you turn on debug
> logging in Nouveau, it should say that it's booting with 570.144.  You ca=
n force it by deleting all
> the *535.113.01* images in /lib/firmware/nvidia/

Nouveau is not probing either with 570.114.

[    5.619048] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/gsp-57=
0.144.bin" loaded - 28542040 byte(s)
[    5.619431] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/bootlo=
ader-570.144.bin" loaded - 4196 byte(s)
[    5.619944] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/booter=
_load-570.144.bin" loaded - 59272 byte(s)
[    5.620351] nouveau 0000:01:00.0: gsp: firmware "nvidia/tu117/gsp/booter=
_unload-570.144.bin" loaded - 39304 byte(s)
[    5.620356] nouveau 0000:01:00.0: gsp: RM version: 570.144
...
[    5.860631] nouveau 0000:01:00.0: sec2(gsp):booter-load: booting
[    5.860943] nouveau 0000:01:00.0: sec2(gsp): mbox 00000031 00000000
[    5.860961] nouveau 0000:01:00.0: sec2(gsp):booter-load: boot failed: -5
[    5.860982] nouveau 0000:01:00.0: gsp: released sec2 falcon

This suggests that the firmware itself is part of the issue. I can send
the full boot logs from nouveau in debug if needed.

I also tried the fix given by John at [1] but got the same error so it
may be a different issue.

[1]: https://lore.kernel.org/rust-for-linux/4beba5c3-a117-4cb7-8fed-2f1c133=
dfec2@nvidia.com
