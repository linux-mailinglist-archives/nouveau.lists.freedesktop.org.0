Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A0CD3A109
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 09:12:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 93EAF10E38F;
	Mon, 19 Jan 2026 08:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SeA972Pq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DE53B44BDC;
	Mon, 19 Jan 2026 08:03:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768809833;
 b=yY1OeQ4g0+LtqnwHo3Hs3MHgsdEnaIZMW0LsRI9AZf2EiAdkaKqgcRDGxpmpAI1TebTk1
 SAHJJMZdi9eEOrc3wqHFX3vAH3Vj1vCpAdwdySTyjsuqnw58yWvpTV07/C1PmQpP+qW/rsg
 F8grN1nhAur4XJmr1oqsV0BG5iM01sF9jgGWaDa3inT5d9PN5o8Eq1YRp1qA7d98VfiIAxy
 nkkKGDs3I5g5VTHb5rnoyG3WX8hAIyJPFhREepSEWQDH14pb6YQVg8jQpXjfTXWyuDfN+m4
 2wZfTxUgioUOIX5ZCgLDFBuhODgHI7vm6DXBtU42uBA1ExHMF7cfRA8cP4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768809833; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oBAMdFVCCmhA/ng7WZd28VOWa5rtZ17Z/V0Jqpmrmak=;
 b=WymQgCKvyZJgab1t+k8Ik/q2bdAF2EANxaJp0ucE+RJLcKTWlSYPGgAk2f9apCCcBgMEl
 iYZH7swY6LED+1sjFNf5rpru4tCfGj3DVu1PgZee1HuQROI3iWN5FVjobtgJ+AEfYzEO8fC
 25f5qGby7MMXbpHqRpble9UQKHoUsZjmIr6e1UdGCA/CtsN3Wug3HZSxyf4K0W0szN8rquF
 sYY8RRRFapkrSP5Mebjexas6ZLQwucKCCbcpH6YYV4Me/viB+vYzdTHTrPkmZ1whzLCqdnJ
 Y+ixndWEhzCSjCSEq/1tu4hnfd88cjk0E1wZ9hSynGp3JrSGRSAgBuRNzs3Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E0AA44BB3
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 08:03:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5C410E102
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768810351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBAMdFVCCmhA/ng7WZd28VOWa5rtZ17Z/V0Jqpmrmak=;
	b=SeA972PqBRq5ysZr3CPzuytJF2VpBKxIQR8c0UU28JImaGg/KVsH85YcBS/0tawAq1AIS+
	LrY426Disj/+BCcHthIr2stJR8BHklzVxxQmCzlGz1vFgqYK4aTbob5Ah4mvUbI0bB45+J
	spNcsvUaVGj/1eSlGyIPklXj5uEdY2c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-YNToVgEgMzqhHMS3uJo1NQ-1; Mon, 19 Jan 2026 03:12:30 -0500
X-MC-Unique: YNToVgEgMzqhHMS3uJo1NQ-1
X-Mimecast-MFC-AGG-ID: YNToVgEgMzqhHMS3uJo1NQ_1768810349
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-431054c09e3so3803131f8f.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 19 Jan 2026 00:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810349; x=1769415149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IrVKem3nAe+0CwK06WinJqWFJAcSYj2lCpqp7+82kA=;
        b=YE4FdK0MkS6GmjZ7C/rq5pmCFnym1OGeJzo/jjLRoHVgU60eQnbrhM72Tzm6qrGT/m
         GLZeb6OuZhP9HIGP3Dtk5v2uZplIvZBcCG7gqVfzVW+b46AWwndWzmKnQU32XzafD0h+
         g4ATKhNq5wKbW+ZJ8c8wEpJj5OVA7o0wHWzzbA+M6c4EKpavNrrNZC3fKlyt0dUSPqca
         1FjPmcK2Fb1Y+GiRc3+psPe3mglnC9iAYwkpNp260CJ/+vbwCQXqoKflT+uK3QEXyq/N
         tb1O+WNh8VFBVe9tE1XBEmvasCb1fL/xSQiltsZrkRCzSYmJiW6UA5MluFO6+kFvYmbV
         N8Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL3PtsUR5sko+G8wQRxszKghvBlXNNjBnO6kicRQeitsbkiZKZ0T7qrXy3lkbEQiH49b3FEKhe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqIATvxf/I6kK4nVWitXX5wY+SZrOFDTy2LcMV2ahF3hs49VVv
	gFgAn6Tu8Ss3hIXerDkpmpRo22hZ4Z9RKr1NF8Lsb/MU+q3/o+coPOdgn1RHE6Bk7oI3xyhjS1S
	0daO0jbE1tZucc1UWgg4Bux8kxd81Pb+QUO2U3HtVFSazyRl3G3pg73T1594iUufQQVskvsj/X8
	E=
X-Gm-Gg: AY/fxX5L9mrwA1o5hk7zt/my3gdSkpeRSbkuVP/kuJvNq+yFNJ3fJ8cgKykNhyQpo/B
	1O1e6+JwHTDyGzM6E2Qy3H4hnxVDqN7yeTb2UXoCFagYvLUt7UZ/4JF4h/wS/PdlDplD469iezd
	Es6oFpq/hfzQ9AV50/jPT4D7wY+OSFBWrYO5JQlOD4US+eLY3mtwsOrIylqq1TPC71RHObt7dUj
	y6/8fKY9VNmuVdxZzSE/wMJ4qikzsDzqY/r8NkSGAHKU6a5iQGDXBkc9Gu3PWJv9dAP5Y+n487R
	2Drp9F9VY2RRhU993mmKJn9PtDKiKVYtqAU0zdOzijLcXrcoL959VjdZuP5NsM/sZjHMHqQzXA9
	F+Xf2YGgDBRZ1Jc2NLWQdyttF25DosybWeyma7R7jp/Y0g9B3ygG+vUJNV1k=
X-Received: by 2002:a05:6000:230f:b0:430:f7dc:7e8e with SMTP id
 ffacd0b85a97d-43569bbec67mr11617753f8f.34.1768810348572;
        Mon, 19 Jan 2026 00:12:28 -0800 (PST)
X-Received: by 2002:a05:6000:230f:b0:430:f7dc:7e8e with SMTP id
 ffacd0b85a97d-43569bbec67mr11617726f8f.34.1768810348160;
        Mon, 19 Jan 2026 00:12:28 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d4f:9000:fec8:2510:a75b:340d?
 ([2001:16b8:3d4f:9000:fec8:2510:a75b:340d])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921da2sm21567501f8f.1.2026.01.19.00.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:12:27 -0800 (PST)
Message-ID: <526db1d7a9122c8fe4557d6ee6950cf0e31e516c.camel@redhat.com>
Subject: Re: [PATCH] Fix scdc implementation missing in GK208B NVidia Card
 (gk104_sor_hdmi)
From: Philipp Stanner <pstanner@redhat.com>
To: Giuseppe Ranieri <giuseppe@ranieri.dev>, nouveau@lists.freedesktop.org
Date: Mon, 19 Jan 2026 09:12:27 +0100
In-Reply-To: <aWuZfMo5cMLwNRax@linux-gentoo>
References: <aWuZfMo5cMLwNRax@linux-gentoo>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CkL04j_ykoKjnWQbB2myBj5XMZjEamrBL5tPKBv9v6w_1768810349
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VEFMXYXQNV6WCJAF34DHKNSL2UDUCSXQ
X-Message-ID-Hash: VEFMXYXQNV6WCJAF34DHKNSL2UDUCSXQ
X-MailFrom: pstanner@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VEFMXYXQNV6WCJAF34DHKNSL2UDUCSXQ/>
Archived-At: 
 <https://lore.freedesktop.org/526db1d7a9122c8fe4557d6ee6950cf0e31e516c.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-01-17 at 15:15 +0100, Giuseppe Ranieri wrote:
>=20
> I fixed a problem for the GK208B NVidia Card (GT710):=20
> the initialization was broken my card support scdc channel but the implem=
entation was missing.
>=20
> The problem was tracked by Mathias Anselmann in
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219561=C2=A0and https://git=
lab.freedesktop.org/drm/nouveau/-/issues/402

Those two links should be moved to Closes: tags above your Signed-off-
by tag. See the global git log for inspiration.

>=20
> This patch fix the card initialization and fix audio problem on my card G=
K208B=C2=A0=20
> the code path is shared by=20
> nouveau/nvkm/engine/device/base.c- .name =3D "GK110",
> nouveau/nvkm/engine/device/base.c- .name =3D "GK110B",
> nouveau/nvkm/engine/device/base.c- .name =3D "GK208B",
> nouveau/nvkm/engine/device/base.c- .name =3D "GK208",
>=20
> I have done another patch so the code don=C2=B4t broke anymore the initia=
lization if the scdc implementation is missing when supported by the card. =
It will raise a DBG message instead.

So the other patch is related to this one here? If so, they should be
submitted as a patch series (e.g., `git format-patch --histogram
HEAD~2`).

Also, the commit message could need some grammar improvements ;-)


Greetings,
Philipp

>=20
>=20
> Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
> ---
>=20
> diff '--color=3Dauto' -ur a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk10=
4.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c=092025-11-30 23:42=
:10.000000000 +0100
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c=092026-01-16 19:03=
:51.175827296 +0100
> @@ -106,6 +106,7 @@
> =C2=A0const struct nvkm_ior_func_hdmi
> =C2=A0gk104_sor_hdmi =3D {
> =C2=A0=09.ctrl =3D gk104_sor_hdmi_ctrl,
> +=09.scdc =3D gm200_sor_hdmi_scdc,
> =C2=A0=09.infoframe_avi =3D gk104_sor_hdmi_infoframe_avi,
> =C2=A0=09.infoframe_vsi =3D gk104_sor_hdmi_infoframe_vsi,
> =C2=A0};
> =C2=A0
>=20

