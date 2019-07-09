Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F8863CC6
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2019 22:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71708976D;
	Tue,  9 Jul 2019 20:36:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0535C8976D
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2019 20:36:36 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id 34so6939641uar.8
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2019 13:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=U4wKhdkHkZ/yNmM+SKSLAeyIuX6Clr6+AKestGsVwcs=;
 b=hqaERRR3AHZq+zDORur4ZyajwkZMh6sOoH0bv4WCMBgBtO7rBTx0F3qZXh7qP45Xnt
 r41EKdtTqf9OEq6p/QkIagUDiRQ6gvkthRyvFzn5Du3/8eiX6aKzaxDwkbuBsOI0xW12
 LlVcaACey1imMC7sENAFPXsjQDL0EuBPRWehZx1PG2ezqErP5A0+hz8yWUw84+bFKKUA
 F3dBcnO1Sp/7r2/4QcYgBUKm8YpPiVkJ2kFoax3rF1Ozg7njXHV0ogILMAd76F0nStKN
 0Ur+zGcFAbiuk9l5lRGXeB8e54gXys3ZvAVKQdUKj1rSrsrauCKVaDNB9aFK2i7Z9qZg
 gFNg==
X-Gm-Message-State: APjAAAWrPgj+7rXdNod1pvVieRMosZAHnp4Z2y/cIlCS0a9bDxXSaR19
 fQiY9T1+Ve/S+jKDez2e0XKuHoWqHgydxDG6n8GwPg==
X-Google-Smtp-Source: APXvYqxkrG6bgnWS3Iw+2fXYkhJUf1uixIYunxVJuMGFho5MO9hEzazMHnvVmPqTVw5GHsqTz7of5d6FZUbFPXP643I=
X-Received: by 2002:ab0:290a:: with SMTP id v10mr1374563uap.74.1562704595024; 
 Tue, 09 Jul 2019 13:36:35 -0700 (PDT)
MIME-Version: 1.0
From: Fernando Sahmkow <fsahmkow27@gmail.com>
Date: Tue, 9 Jul 2019 16:36:24 -0400
Message-ID: <CA+MSTo-k37qmJ1zZbUECm2HpuhZmSZoOxtypbkT2y8=q-x1vtw@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=U4wKhdkHkZ/yNmM+SKSLAeyIuX6Clr6+AKestGsVwcs=;
 b=fj0s0xHDux0xin9HZARWNBbrAtgtvO2Cg7AVILK357uIdVKbFHPYSU9zTnfczVIeMg
 i54eEN9VQ7SA26r+b3D6kznQwVhsBhlWwztPS4ccpkeH5oIY6usppw4zW+T4hi/wxwBN
 ZuefgamGrz/5IqCWsjQW/KY+g6kiRIMUSbqX5NOkV9h0MJQDLjCb55FJoZlnmkueecNT
 h4PgSUh3kBau/tp7sE9nTIU8Kve3mM68NdF2HkYkawmPqcC3PdTSm81AmfPeDQxADmhy
 H6n8GF7iddeOZoaXuR2/Nj8q186dmTSoKZXv1TLG3hwmlru38ZXsQScEkQTPZj5UaEK8
 nOiA==
Subject: [Nouveau] Questions on Falcon Command Processor
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0883437457=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0883437457==
Content-Type: multipart/alternative; boundary="000000000000467cbf058d4584f8"

--000000000000467cbf058d4584f8
Content-Type: text/plain; charset="UTF-8"

So now I'm to looking to implement NVDec and as far as I know the game
submits a series of commands to the service. This commands are processed by
Falcon and then it does its magic. Do you guys got any RE on Falcon
commands and how they execute different workloads ?

--000000000000467cbf058d4584f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So now I&#39;m to looking to implement NVDec and as far as=
 I know the game submits a series of commands to the service. This commands=
 are processed by Falcon and then it does its magic. Do you guys got any RE=
 on Falcon commands and how they execute different workloads ?</div>

--000000000000467cbf058d4584f8--

--===============0883437457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0883437457==--
