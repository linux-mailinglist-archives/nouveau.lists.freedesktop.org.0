Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1A41F02E
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 17:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3236B6EDE9;
	Fri,  1 Oct 2021 15:00:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560CF6EDE9
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 15:00:57 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id j13so9206154qtq.6
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=657jtzPdp6vWi5s2j6jc+EpqVk2uIrgDoYAwFxUSKI0=;
 b=aQycJLN6VKQXUTVhG8LhnX6sYeaZehAevbW65ybbhZ6hdOSfVhwMUhs46xzF681K9T
 3+O3iWUbx6Me3UJ4uitzBZLoU114+wdEXTV4ur6K4tcYu1fbtvJjngC7HQgXbPqYasO1
 3AjpBhhqBFnFJHWCgy+aCLDmiTNUaWgAr+H9y99vVyvhDGMP7BQpEL4elJcoxkIenV31
 FaAwWaHSfCDp0mJCwkKqUsfPwqrRQQ7mjt+jzOjhTTwKJRv8Q2iVK7DMIEmqHcbocOY8
 hr7/E7VWFRrfjIZGI2u4t+JTA4NalunwGCAJjP6xAUCKYef5aydqcCTlEMPi+sBpwMr6
 o9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=657jtzPdp6vWi5s2j6jc+EpqVk2uIrgDoYAwFxUSKI0=;
 b=16EBgBRe40YSkFwapHZIC7KyE+B5ppR5pB5nabUP68piy3TRBiZL6pH/6+xxurkK9q
 DRwGEOGtnawYyycwpqjZS8f1Wb/doDQxTKjYiOniaKVK6qEYemnW6cUe0Rflohc1kPIL
 gS0GVq1D42UOWXZEtvbFSxhqLeC4zthtBNBtbSROfBEmhNms4uJAyX8ndWh1VjSPaygT
 mRH6T5wW1jZXwLzhgQUOUtjwvgqUSjPcGzbiku5eS2eIe2KwAEwiVrFcXwAG9fSPSsvr
 ipbobd3Z/P1y2WNPE0GXXxmzJoMzvhBRh1ySuq4g7J0NkmrLo/PYSG0JvwBmtOrSN2iX
 e8oQ==
X-Gm-Message-State: AOAM531qTDcWvRInQS24EdfzuSscQfd5qCRh2W2cMuK6EtXZWf3nt+jS
 lvsafYgRfDk1nO3lmM3TeTp37OUELWLNKkji9LmVd6WrKxA=
X-Google-Smtp-Source: ABdhPJxrhBLHaspOBhKUjsC7EHlweuX/CDyzlpoeT5bAMFp+zZxoZtDGsGbKn4Ir/J3tHcd1V6QZgCCSwlyDSFJNMuw=
X-Received: by 2002:ac8:4a10:: with SMTP id x16mr13774794qtq.97.1633100455876; 
 Fri, 01 Oct 2021 08:00:55 -0700 (PDT)
MIME-Version: 1.0
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 1 Oct 2021 11:00:44 -0400
Message-ID: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000008e1f3005cd4bd43f"
Subject: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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

--0000000000008e1f3005cd4bd43f
Content-Type: text/plain; charset="UTF-8"

I am trying to get Nouveau running and also playing video.
lspci | grep VGA shows
03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev a2)

syslog shows nouveau loaded

But video performance is SLOW - dropping frames.

have I missed something ?

How do I get better video performance ?

Thanks,

Jerry

--0000000000008e1f3005cd4bd43f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am trying to get Nouveau running and also playing video.=
<div>lspci | grep VGA shows</div><div>03:00.0 VGA compatible controller: NV=
IDIA Corporation GT218 [ION] (rev a2)<br></div><div><br></div><div>syslog s=
hows nouveau loaded</div><div><br></div><div>But video performance is SLOW =
- dropping=C2=A0frames.</div><div><br></div><div>have I missed something ?<=
/div><div><br></div><div>How do I get better video performance ?</div><div>=
<br></div><div>Thanks,</div><div><br></div><div>Jerry</div></div>

--0000000000008e1f3005cd4bd43f--
