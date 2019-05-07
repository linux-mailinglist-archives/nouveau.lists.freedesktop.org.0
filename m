Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB118506
	for <lists+nouveau@lfdr.de>; Thu,  9 May 2019 08:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FE289B0D;
	Thu,  9 May 2019 06:03:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10E46E7D6
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 13:38:57 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e56so18741741ede.7
 for <nouveau@lists.freedesktop.org>; Tue, 07 May 2019 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/C/HCORlr07koaOJLgkE4wTN2SoyXeedi4I4Qd+iZVo=;
 b=EmOv65GROD86y+FVtA1XQQPSjkp7wqvtqtvI/33US1bfmWbLP3iazpvDWhrr3qzWO0
 7f4xYCNO08+YuOAJkt1dYbXtxp1X56wRG31yFhmAOyZgLXe4vBxfcnluOrV1EJZ+g/yo
 8DAXiClE0Q/ZEEBjUbFVk8HiT3iuNcecV12w+MS3pfJS1iA6zSz3tfAP47RdcNLwXfli
 lLdurjwyUELVk4Y1e1+zu55LANv+iRTechZl9kP57L3792HZWFnvAl5Q6LuP2EzagV27
 pe8YRUUzICTvTP529gqgnt9bDF64vPg61n3gRwCp3KDl58XlYQh4/hkkhTygSSh3r2+7
 xwZw==
X-Gm-Message-State: APjAAAVTsWXjnlFaWdvX2V8rEuA4o/9SjXeL+3/i2++7LehWmOP6PPji
 N5AOtj3RCPrUkVZKrDwZ+6SaPieTwv4K04R01Wa3ulcADMo=
X-Google-Smtp-Source: APXvYqzN/VedrN2MUV2xdwu+i2geZnqwpY6L31CGxB6bfKm+cUAUfvCLS8ohh6XokFk1GSJD2lDDMQf/QW3PmvmeYnQ=
X-Received: by 2002:a17:906:f91:: with SMTP id
 q17mr5015158ejj.63.1557236335979; 
 Tue, 07 May 2019 06:38:55 -0700 (PDT)
MIME-Version: 1.0
From: Karthik Guru <karth251998@gmail.com>
Date: Tue, 7 May 2019 19:08:45 +0530
Message-ID: <CAKzjFsurZr1UtEyReOR_rpqO1r-fEFu+FxKpDF3N+2fsvWR_Uw@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 09 May 2019 06:03:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/C/HCORlr07koaOJLgkE4wTN2SoyXeedi4I4Qd+iZVo=;
 b=s1Ec83eAW8DhEVMIhoS1BpNTEs5kzI3Bcn5uPJgXYmouNZT+YHrX+ysiD3+tOCSPKT
 b8stCDoJ37tU0qk+APlLCreUvVha1xtOf3e134WN1cKlg/bmkTsrqubtrNGapVlXRZwF
 Sm9370CME8Yc9HUbPU3ATfO6vDtixrOtE1g9GcAqkORPmNktCe2RCPSIRQdmYxFrd2PG
 5IS46ZiJi5fHJh4mXEaRa/hD/P7niA3GylGFUvFF1S85/lOPauas1qasXhZokWQCEj7R
 WZiLMHY8q2AnPYXZd2T0VFpmgsR9s00QifP+DtOaeuVMZTp4VMh3YieegTuji6xQRQjc
 npUw==
Subject: [Nouveau] Project :Adding new compiler optimization Passes to
 Codegen
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
Content-Type: multipart/mixed; boundary="===============1372226162=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1372226162==
Content-Type: multipart/alternative; boundary="000000000000a3359a05884c5615"

--000000000000a3359a05884c5615
Content-Type: text/plain; charset="UTF-8"

Hello
I am looking to contribute to the about Nouveau based project.

Could you please tell me how I can participate in  XORG EVOC for this
project?

Thank you

--000000000000a3359a05884c5615
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello<div>I am looking to contribute to the about Nouveau =
based project.</div><div><br></div><div>Could you please tell me how I can =
participate in=C2=A0 XORG EVOC for this project?</div><div><br></div><div>T=
hank you</div></div>

--000000000000a3359a05884c5615--

--===============1372226162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1372226162==--
