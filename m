Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C928D4CE15F
	for <lists+nouveau@lfdr.de>; Sat,  5 Mar 2022 01:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED29510E1EB;
	Sat,  5 Mar 2022 00:12:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B7510E1EB
 for <nouveau@lists.freedesktop.org>; Sat,  5 Mar 2022 00:12:20 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso8483556pjb.0
 for <nouveau@lists.freedesktop.org>; Fri, 04 Mar 2022 16:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=IRedZtTSLySgfmJ1ZnB26xosaRGfKlIvu1jFzmaxVcY=;
 b=Quy5Soxp89iOcNC58qcjj2nOKcrDjQxISb9jNXx3zdUMghWAxjUKCgwJoJJW9r9+Li
 KK4xvUTUBeTnStSASwpiNdoL4a/7biIsIK6d9BDi7PB4tRINaoUyP779K4hcoRfzveez
 0eJZq3WEtHJlwX6U3fi1w93/82EXMOMCKVTeJ0S608yUfkcWyBG0MCdcfUCkYM6uYPtm
 wObTECGg8sYkcThj3eP2mkwNAijZVEAolg00nDRb2LQJZ4kCqxAG5Zgr1IYyZqIpXGMl
 FzPrutxjjfbLZXtgtUOspftgT5DDUP91lX4ledkYOfDf+oh1swFN+kPBfukfwhJcDZRk
 hM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IRedZtTSLySgfmJ1ZnB26xosaRGfKlIvu1jFzmaxVcY=;
 b=LP6KLLNMp6IdIuPazQPvVwbd4MftAzDtO98Wr4lm79+LVyBTx8/HnAf8QYTxKxM9dM
 8AZ4yCZ878J96PzQXZ5431U3n89k1UgeQOjBQT7Ihlc4xdeq5OtOVD8MxadG+fxU8e99
 1PNswlyVAfdWzCnxvHmvB5ZXmw1nJccIUkt+ZSXfKJEQcBluG5iJ0Wv+3gq28/LpJtjf
 qSub3PDEgKYT4PvHkPTSXK7fRRKiXT0cHXRVjeozufmx8VaMW7MGO1VuseALtH+oFZZE
 Gua/5jRdl9S+M2ZNRn3SHT8o08kONtUohqt4+6SCskxmDisC60SYg+TYLperiYjaiXlW
 M5rA==
X-Gm-Message-State: AOAM530YDPDxETIFnfpjXskW5YU2mHxRbiMrGtHBNJXQpkUujes62mbO
 SBi2gPCtzRnP0sOuUql2ZSUAV8b8yFLsekHhj+8+qYkj
X-Google-Smtp-Source: ABdhPJyW13lg3/QCcGkje7tSHMBNMnosrKge2hQb+I9eiouZyarFhl07vZY4sYRUyuW7YL0A/u0ZUiLm49eb0GHAB5E=
X-Received: by 2002:a17:90b:1b0e:b0:1bf:1c4f:2bc4 with SMTP id
 nu14-20020a17090b1b0e00b001bf1c4f2bc4mr1179764pjb.200.1646439138249; Fri, 04
 Mar 2022 16:12:18 -0800 (PST)
MIME-Version: 1.0
From: Andre Costa <andre.ocosta@gmail.com>
Date: Fri, 4 Mar 2022 21:12:07 -0300
Message-ID: <CAMBDoMOXuowh-wrc32FR_O7oucOYBMhAP6hR-T7GjNd8DqUrsQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000fad29205d96d7b92"
Subject: [Nouveau] External monitor support for GTX 1650 (NV167/TU117)
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

--000000000000fad29205d96d7b92
Content-Type: text/plain; charset="UTF-8"

Hi there,

I just bought an Acer Nitro 5 (AN515-44) notebook with an AMD Renoir iGPU
and a GTX 1650 dGPU. I installed Fedora 35 and, for the most part, it's
working great. The only issue so far is that I cannot use Wayland +
external monitor with Nouveau -- it does recognize the external monitor,
but only renders the top half of the screen, the bottom half remains
(literally) blank.

(BTW the HDMI port is wired to the GTX 1650)

For the record, I can use the external monitor just fine with Nvidia's
proprietary driver on X11, but I'd rather use Nouveau if possible.

I know support for the NV160 family is still coming up according to the feature
matrix <https://nouveau.freedesktop.org/FeatureMatrix.html>, so I'll
patiently wait. I just wanted to volunteer to do some testing on this
specific setup if this can help in any way. Just let me know.

Keep up the great work!

Cheers,
Andre

--000000000000fad29205d96d7b92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi there,</div><div><br></div><div>I just bought an A=
cer Nitro 5 (AN515-44) notebook with an AMD Renoir iGPU and a GTX 1650 dGPU=
. I installed Fedora 35 and, for the most part, it&#39;s working great. The=
 only issue so far is that I cannot use Wayland + external monitor with Nou=
veau -- it does recognize the external monitor, but only renders the top ha=
lf of the screen, the bottom half remains (literally) blank.</div><div><br>=
</div><div>(BTW the HDMI port is wired to the GTX 1650)</div><div><br></div=
><div>For the record, I can use the external monitor just fine with Nvidia&=
#39;s proprietary driver on X11, but I&#39;d rather use Nouveau if possible=
.</div><div><br></div><div>I know support for the NV160 family is still com=
ing up according to the <a href=3D"https://nouveau.freedesktop.org/FeatureM=
atrix.html">feature matrix</a>, so I&#39;ll patiently wait. I just wanted t=
o volunteer to do some testing on this specific setup if this can help in a=
ny way. Just let me know.</div><div><br></div><div>Keep up the great work!<=
/div><div><br></div><div>Cheers,</div><div>Andre<br></div></div>

--000000000000fad29205d96d7b92--
