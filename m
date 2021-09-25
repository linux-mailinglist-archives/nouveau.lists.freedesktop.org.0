Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01041F958
	for <lists+nouveau@lfdr.de>; Sat,  2 Oct 2021 04:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69F16F465;
	Sat,  2 Oct 2021 02:24:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D283F6E44D
 for <nouveau@lists.freedesktop.org>; Sat, 25 Sep 2021 17:02:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w17so37113152wrv.10
 for <nouveau@lists.freedesktop.org>; Sat, 25 Sep 2021 10:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=S8BPntV9XgBE/TCsHZq87GqqqpOoQIwhpecS863GA/A=;
 b=gTT/VwU+ytgaNHG0xLK88i6bEcZ14G3DVf9NUsj4mGkhhbzmR2EjU0ju2ByEChye7S
 hK0stRsealcQstMdZiLsGeddqnzEDANpxuBo511+i/vlvR72PM93B85sMJ0fkrWidGXq
 sOQAkMt+yLGv8+vrRaomVHOe4w6L16o7/4QNpN0yo5b7eJQaDtn464HDn0RyFmzB5HuE
 Fo6AEwsVhUG4o+uxDCtiZafR7oGxN0yoSYKxFJQd96ZiYzD3f1gRebfH+Olb/QhGk/wi
 AA6tD84p/y8L7K54eoV6JwSf9tZgW6fsRh0J9TULyJFQKHDPHEkvpZoGuuJjnLAJ3tQ8
 bGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=S8BPntV9XgBE/TCsHZq87GqqqpOoQIwhpecS863GA/A=;
 b=nwKnRyYGkSaCeumpG3PjtP8anEGtsRpCsB2Xx5SsJmFnVs1RLEzfqlWt7h8dfN10aF
 Jcw0wfH2lCROg7qQUkm+AIVIb9vPCY7Akgd9nfUYqGvYcQTCLNdqDXkqdH2q784H+Vo0
 YlXVndAXjh14kDxznCNaiXaq3Vsuni4oLaNQIGGs+6bdbrbIUuuifJpd2yFkFt5idFFC
 giPA5JopXbf6n9feRVPMZXKyoRDrSr0w4a6UVndgc2JFi4L1nz/HOBj7TM20ovV8o2Sj
 Uu0/dBqVcUqVCRQWRabSLGNvpWsIIRm2cFI6MncqG5RLuNp9hhTK9Qh9DdCDvHPMadZ5
 jEcw==
X-Gm-Message-State: AOAM532pPC4W0ZyqG4PLZlpcPalf07VzWhzcM55S05e+M7WkZgBhJRFJ
 OqhT91lm3eonjLYCC5uhPcqqKN2TVSfw2F/si9esI2rCpKk=
X-Google-Smtp-Source: ABdhPJwdVN6LjSDPphsJoVFI8yP8BYP9OjbvlNFq5MtA/4oGGcfK31NNZTSVAYvnw2+18tRJh+bzSJBIQ7p4oRTlKJQ=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr7746763wmc.19.1632589359028;
 Sat, 25 Sep 2021 10:02:39 -0700 (PDT)
MIME-Version: 1.0
From: Oswaldo Graterol <oswaldo.graterol@gmail.com>
Date: Sat, 25 Sep 2021 13:02:13 -0400
Message-ID: <CANj0vJkjpj_wQPVKo65ZKTgvTjXOfpC3hBdW60Z27c0mY8ejtA@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000cf1e0805ccd4d4c8"
X-Mailman-Approved-At: Sat, 02 Oct 2021 02:24:00 +0000
Subject: [Nouveau] Nvidia GeForce 8200M - Image flicker
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

--000000000000cf1e0805ccd4d4c8
Content-Type: text/plain; charset="UTF-8"

Hi,

I installed lubuntu 20.04 amd64 in my old laptop (Compaq CQ60-210 US), but
the screen flicker when i open some program like firefox, i tried nvidia
drivers to GeForce 8200M GPU, but no work to this hardware, i want to use
nouveau drivers but need to fix the flicker problems. Can you help me with
this?

Thank you for any help you can provide.

-- 
Oswaldo Graterol

--000000000000cf1e0805ccd4d4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br clear=3D"all"></div><div>Hi,=C2=A0 <br></div><div=
><br></div><div>I installed lubuntu 20.04 amd64 in my old laptop (Compaq CQ=
60-210 US), but the screen flicker when i open some program like firefox, i=
 tried nvidia drivers to GeForce 8200M GPU, but no work to this hardware, i=
 want to use nouveau drivers but need to fix the flicker problems. Can you =
help me with this?</div><div><br></div><div>Thank you for any help you can =
provide.<br></div><div><br></div><div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div>Oswaldo Graterol</div>=
</div></div></div>

--000000000000cf1e0805ccd4d4c8--
