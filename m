Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CEA82EE5B
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CE110E516;
	Tue, 16 Jan 2024 11:47:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0311610E055
 for <nouveau@lists.freedesktop.org>; Mon, 25 Dec 2023 08:26:02 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5e7c1012a42so29653517b3.3
 for <nouveau@lists.freedesktop.org>; Mon, 25 Dec 2023 00:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703492761; x=1704097561; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VNB8imntS8LBNtKK1nxaZRxw5hb3saJQOKkNzHToqUE=;
 b=fUHk5DJiQeonkBUseLLVvCPTRGm3qG/NWtklBX31lJrFd9RHkjgGuC2WzxguFZ7KAx
 c05XuA9OHq0ZcNg9T4v5xH15NPTKbgdWRN0PqDCdGG2cCngZ+uX67G3ZBzeE9dzsFgP5
 KO4RNIVvEhHB1LsvPasHOQPHRHcAe8IkVzKb/oqSdBgdGKY8b3M8PCVgase3MyOqG8Wd
 zTJVRPY3SgcNdyxZ/StZYsdwDz0DF8v3Nfy9f7V87Y75H+VXovT0OMw5gIsb3vOUxoDD
 j1AqrlVM0eSKW2AtdneeuM9sZrdTuZNmbs3TnIRSZXucS3oR859WvFvtRAwSmDcvXDuA
 zktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703492761; x=1704097561;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VNB8imntS8LBNtKK1nxaZRxw5hb3saJQOKkNzHToqUE=;
 b=G05wFFZ3wVsQHJxIKsXoBU6p4GSsFwx3gaHpXDT9vRo25KFBO2FGLoMFVof2GPMd9l
 c0IuGnP7daG/h8auVfmi+tTlQVXiopGDkMS/km+fig24kei7xalNAqSl9tLKvJT7vT5C
 6Ms3nyGPlkMWtjK3bl+VvLXSyZ+BeThscnj7hUx5N+NoMq7f602zTL7DQP0+MV0QUqaj
 n5BN1Dq/8FKukTTZ8Y4CGF/Imv1FLP23ysPmociSGynE5ZA7uH7jqRy0eJGtkLkpLrvb
 wfI8p3iByhqSw951qp4puQR90uFycHfQljJG5Szuu+2Si4527zf5aAEsz8xFYfTOR9zN
 Ce+Q==
X-Gm-Message-State: AOJu0YzcvU+j/G+g5Ge+PexnZxRw/m/R0C378EDr4mzegBwqLZpUsIZG
 /RS3TYA8MJ2zTkU4W7WWdtvxv77Ip8worCgAtYjgCxtSAhifLg==
X-Google-Smtp-Source: AGHT+IF083Bgt0C2N7LUbBQghDLExLDKK2OiXmQ1oldOTQJnjUyRTofm7RSs13RBrEV6NHXXLTe6uC/yOlvsnsuIfTA=
X-Received: by 2002:a0d:d203:0:b0:5d7:1941:355c with SMTP id
 u3-20020a0dd203000000b005d71941355cmr3390590ywd.67.1703492760958; Mon, 25 Dec
 2023 00:26:00 -0800 (PST)
MIME-Version: 1.0
From: vivek pandya <vivekvpandya@gmail.com>
Date: Mon, 25 Dec 2023 13:55:49 +0530
Message-ID: <CAHYgpoKzo=nuccJhk+jp+fsQFS18wfNQp+oq33GQLF+x9vbGbg@mail.gmail.com>
Subject: Help identifying still open projects on
 https://www.x.org/wiki/SummerOfCodeIdeas/
To: nouveau@lists.freedesktop.org, kherbst@redhat.com
Content-Type: multipart/alternative; boundary="000000000000e4fa30060d5150c8"
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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

--000000000000e4fa30060d5150c8
Content-Type: text/plain; charset="UTF-8"

Hello Karol and other members!

I see that on  https://www.x.org/wiki/SummerOfCodeIdeas/ there are lots of
compiler related tasks but most of them seem very old.
Are they still relevant?
Kindly provide some details.

Sincerely,
Vivek

--000000000000e4fa30060d5150c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Karol and other members!</div><div><br></div><d=
iv>I see that on=C2=A0 <a href=3D"https://www.x.org/wiki/SummerOfCodeIdeas/=
">https://www.x.org/wiki/SummerOfCodeIdeas/</a> there are lots of compiler =
related tasks but most of them seem very old. <br></div><div>Are they still=
 relevant?=C2=A0</div><div>Kindly provide some details.</div><div><br></div=
><div>Sincerely,</div><div>Vivek<br></div></div>

--000000000000e4fa30060d5150c8--
