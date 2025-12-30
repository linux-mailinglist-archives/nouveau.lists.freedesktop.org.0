Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91165CEB8D7
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 09:38:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6260E10E67D;
	Wed, 31 Dec 2025 08:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WcJoGzRD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E66D344C7F;
	Wed, 31 Dec 2025 08:30:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767169800;
 b=Pk09PTWHgRAQKUvVG2NDpfXT1ZQawgrpq6xbbnjvy5f/Op8Yi1V1ZhjZa50LxL4XFBRVP
 ZX4VzxgnM6nLVROZKKJ23CdMtSpKEzl4Sqpm+ClKG7nXGUtrRcVLgwrMBsj/ybJF04Ad7ak
 M2M2DrbW6O9sysSj5gS/y0h8Q7kZFFZ6qQ0I+KqMqz32QFiYd1Y89Bwe/przh5p1lyfb/qv
 mt6MN0m5JoQqvFohE4PwA/m17sdqtANzT36faHbnOzVE/b2OiS+GpdZpZ1KYzaj0bnoZh8e
 EcZfLHG3tHQUgYH3CuKIRVgC2yA1zY+apAAd6Vf8H79ix3Z+tYSu1TspyHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767169800; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cgPj4GmV/3EpBx43SG2F3zNXxdHzXlOKwZZPcptoQD0=;
 b=p7jISTFHUkBuvcpPoJB80x0mbl01w1+aZtGPOWhMew17lzZ2DzCCFhF+uREsBbO+JqlTy
 vuGdAD6zv4I1s60VozZicz2Y+mNuLfJSOCMz1A9rpRevdn7cXmBm1BcZuXACR9GP0BvKWkc
 6+I/SWERaS9Ut7TktjVLiRH33j3KbIhLY4zLnsQvvpZB6XmURXKAtI/tG2XXzZYapi2bBem
 h0ZsCU+PE6guNE9hMK+kQdV5qBJVcXc7utWOdXRLI8sj6K56KZEFM8ZN74DQUWkpql3uNhU
 rqqUnYDz+UEZ3H9p93OV2a+sdOi8jbB9jytoatoM8gS2X8iT7wC+ol0dUieg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 16B2E43E41
	for <nouveau@lists.freedesktop.org>; Tue, 30 Dec 2025 09:15:42 +0000 (UTC)
Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com
 [209.85.128.196])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D81110E62B
	for <nouveau@lists.freedesktop.org>; Tue, 30 Dec 2025 09:23:39 +0000 (UTC)
Received: by mail-yw1-f196.google.com with SMTP id
 00721157ae682-787eb2d8663so124280387b3.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 30 Dec 2025 01:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767086618; x=1767691418;
 darn=lists.freedesktop.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cgPj4GmV/3EpBx43SG2F3zNXxdHzXlOKwZZPcptoQD0=;
        b=WcJoGzRDYReCytZVN88Ct5xAoWUjzHGA/gfMwQ9lEXNbjBWhVOmh96v/TAsDrU8eqq
         HRINRUgP8TijuJF2NTquF0TE+i4AdEdJAzU6wSNSw7X3SjBwJTeZAr/ARDBcDBJo6fal
         C75+oWSjTNZv9CH4M9j0X0XpwsABo20+ZoKa/V6JICYPUTt14/2m9XiJT3ZOoUV2traE
         /mj5zAmnu0VWwJRm14Vmer/qCCryNonlvlU8CB8nZC3y295OiRowmH0lvSaJanROnbME
         Hk9gqFRr6+TYfMyH0bqa03VTIvwJ2GhfECTVLyJQ2FmctQEKa93uHY93dEsHmabkkkCR
         hUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767086618; x=1767691418;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgPj4GmV/3EpBx43SG2F3zNXxdHzXlOKwZZPcptoQD0=;
        b=OG+Av4n8aIeDInLhXfJj5761tM2FacwRwi9t1dTMcoDEDJXcAzdRD09ZSSiRwm6rgl
         gRktgcXR1Bw/YayNxudMK/skKEt/R5XeKWj42Eh3kCORg4BW6R77cc4u+FH99DhGOr0t
         tW+kmr19i7wkiYL5wwWJvwuqQg19iqm0Ofx5z/OYt62E1GtysAC4oyg/9T9coVmW/N5J
         kcVv6bhkaspzcoF13JSKVxM7f7gWLPa9u0x/Uv+IB+Q0jjLPKYPwNNTBr/lspdnDsnYt
         RTbEvYO2KvIUFqPTjYth7rVsXQq3VEsqKEaA16/f4lanLnaIkkdP1MLdT6X34NeRUMSp
         qwQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGVtvtjDNAGYW9lHHDOnuiwK2smqWTXD63hIGtA+aWy0cJmXyIQvNqBW0aa5v/CX5XhVD/pjnm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS4Ud5Wzukipt1m2KxmabkjK6yVqKVSg8X6Ryb+GUr5SjYaVRo
	lcnof1zZyGMJSnqeRO0Ir+THNCrfVDeNX/M2wvkipyX8qOdAZM87TakaKGcQtP3Y9Q7ScawjKaL
	tkBWZdRUGx0cVgDdnFbv+2gbkmgqZr00=
X-Gm-Gg: AY/fxX56ghDNGOiN3fJtpaMqUv2HL57EyL9TEk/GSuRLm922dSsphyTGfgeh5adYFPA
	P1hc8357tScZb9coxn+yMqTPZIhFWAjh6+0CMzFLAHm/R+OusNHXgeTDiJYyjucp8eZLLiHi/oJ
	MDLaH2FTsIvH45vU453RryzfFR4MbsyZslrHgHxYbLEN8OInc3rUSjWqg+wB75zn5jTSsE6hxMD
	HQlgyzup35RjGzljF5+04xqeTXBAim10QfAWFOoXDzGhb61sFlOiSjC97kDNI17V4CJmRj3odl+
	Zjy4F9oUQTp23B/ivl4SsMmVnKVkNMs=
X-Google-Smtp-Source: 
 AGHT+IF+xA9eHpMgGjR0M99hI+1fVr8JqG8TRCy7ICg6HqCKQl6Un8/FwyPCufYLFjB3CSqS0OxEKWme2WO6raUGor0=
X-Received: by 2002:a05:690c:6610:b0:78f:f30f:e74b with SMTP id
 00721157ae682-78ff310623bmr159318587b3.25.1767086617819; Tue, 30 Dec 2025
 01:23:37 -0800 (PST)
MIME-Version: 1.0
From: Philip Mill <philipmill86@gmail.com>
Date: Tue, 30 Dec 2025 10:23:25 +0100
X-Gm-Features: AQt7F2pcPbnd93TQJYFxHvTLepWUcoLs4V72840ga5DHuuX6P1BLCaGKnYL14e8
Message-ID: 
 <CAKRF1bQHjZzRFn3t_mcUC=OkgK-7F0XDMvgpzmCOpJSjEPuAmA@mail.gmail.com>
Subject: Your product is needed
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000247dfa064727eaed"
X-MailFrom: philipmill86@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: F6545TJAARQ6LA4NJFARUUJEPVL7LRH6
X-Message-ID-Hash: F6545TJAARQ6LA4NJFARUUJEPVL7LRH6
X-Mailman-Approved-At: Wed, 31 Dec 2025 08:29:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F6545TJAARQ6LA4NJFARUUJEPVL7LRH6/>
Archived-At: 
 <https://lore.freedesktop.org/CAKRF1bQHjZzRFn3t_mcUC=OkgK-7F0XDMvgpzmCOpJSjEPuAmA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--000000000000247dfa064727eaed
Content-Type: text/plain; charset="UTF-8"

Hello,

We are looking for steady suppliers of your products  to our company which
will be on a monthly basis.

Kindly respond for details through: phillipsmills0@gmail.com

Regards,

Philip Mill

--000000000000247dfa064727eaed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>We are looking for steady suppliers of your =
products =C2=A0to our company which will be on a monthly basis.<br><br>Kind=
ly respond for details through:=C2=A0<a href=3D"mailto:phillipsmills0@gmail=
.com" target=3D"_blank">phillipsmills0@gmail.com</a><br><br>Regards, =C2=A0=
<font color=3D"#888888"><font color=3D"#888888"><br>=C2=A0<br>Philip Mill</=
font></font></div>

--000000000000247dfa064727eaed--
