Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0A880E9A
	for <lists+nouveau@lfdr.de>; Wed, 20 Mar 2024 10:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C60210F237;
	Wed, 20 Mar 2024 09:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3RvyvzP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7D010E420
 for <nouveau@lists.freedesktop.org>; Sun, 25 Feb 2024 21:50:51 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-42e89610ed8so79931cf.3
 for <nouveau@lists.freedesktop.org>; Sun, 25 Feb 2024 13:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708897850; x=1709502650; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=G07gU5mKzmeoSHSZqJiLpVOZvBgA31ZNZrms5SE3Uws=;
 b=T3RvyvzPhZa7OehY89dy81Mep/Y489ZeDrHPKSGOBa/XxFxw3PUvtICSsZnijy0B1B
 0VT3DDDotujoeRsSlMk8QZd7aC/4ApbxkdcdBg3wd53/s3uX+m8wchGSOEFzeLzpOUlY
 BGhFew191ISMjLIwOLCIyHtrYL4ehF7740+jGtZLkLVNn/Hn13ru0hgMScsUT9aMFKAi
 9UBXHG8dpE9eYK5CBkQ6GmDWxvSYjx/Kjzp+BrPqkvrg5SQS5WT4MivrKU/bzECJw+kG
 zbicWORRVOecY4cCp4HIXWt18o9d2skZnG3HlKC5sWUHktk/8lOGgonY6jZqqOzQadfv
 CGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708897850; x=1709502650;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G07gU5mKzmeoSHSZqJiLpVOZvBgA31ZNZrms5SE3Uws=;
 b=KoQBoqJtaXKzkrmkmRHJa80Cs0T1PBoY8Ad3ce/GHQ+wHMvIs+z0JicTpxGJlLA0Zj
 k2YNR2ddIWPLxkAeFZgU6iJS1uuqLacbM6Oe0Z46DdI9+NyKfc9Ai+zbz6IHff05v6hc
 Rk+OeKMWGm1SDiiMR+gAfC7efP3pgO+Zi/tBQyV7+pOOi1Jx8QPzC3L7iZoGDBGNu+Iu
 41YTJO/q/hR68VC9KPoDBNR9fpEhHQiqvu4NOvC35F6sIdCZ3QhRqFYI6jJfb2BDPOTY
 HCYo+IgzjkmdiUiKQ9J9yYUvj6KnShsDfKxUQe8uYlwh7NBHZvkmLITo/Tdy/dyHUX1o
 HS9g==
X-Gm-Message-State: AOJu0YxwjZz+a8nEANJatrRXaEmMyLCQKyTuXg7msU2nHPa1XMweW8Q9
 rAGHJtElQGZL3+9daXpEOHnw2qhFSpkHmp3Ij5ZR5j46mAydzjk/D+m1D+GdXEY0fAYLeTYKszR
 IB/F2hncTXriFePkgxUkjw1aVQ7yRFyGmEZ/Tow==
X-Google-Smtp-Source: AGHT+IGw04WbNluJ5XzbjbR8RbBmdESLklGhTrp2RobRCfvxPG4JkbtDtu6f+U1C5iaxaUWjdOl7ezVinSnp8MKcV60=
X-Received: by 2002:ac8:7411:0:b0:42e:6f6a:1b03 with SMTP id
 p17-20020ac87411000000b0042e6f6a1b03mr5807809qtq.35.1708897850237; Sun, 25
 Feb 2024 13:50:50 -0800 (PST)
MIME-Version: 1.0
From: Ojus Chugh <ojuschugh@gmail.com>
Date: Mon, 26 Feb 2024 03:20:40 +0530
Message-ID: <CAES57QXw50Z4XUaE0fCr-==br05xY2u=sNGMv84O1f45Ys4gQw@mail.gmail.com>
Subject: Regarding EVoC Project-Adding new compiler optimization Passes to
 Codegen
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000052260906123bc91a"
X-Mailman-Approved-At: Wed, 20 Mar 2024 09:31:27 +0000
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

--00000000000052260906123bc91a
Content-Type: text/plain; charset="UTF-8"

Greetings!

I am Ojus Chugh :D. While exploring the EVoC projects list, I became
interested in a project titled "Adding New Compiler Optimization Passes to
Codegen." However, I am unable to find the link to the GitHub or GitLab
repository. Could anyone please guide me on the next steps? I am somewhat
new to FreeDesktop.org.

This is my Github -:https://github.com/ojuschugh1/

Thank you in advance :D

Kind Regards,
Ojus Chugh

--00000000000052260906123bc91a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings!<br><br>I am Ojus Chugh :D. While exploring the =
EVoC projects list, I became interested in a project titled &quot;Adding Ne=
w Compiler Optimization Passes to Codegen.&quot; However, I am unable to fi=
nd the link to the GitHub or GitLab repository. Could anyone please guide m=
e on the next steps? I am somewhat new to FreeDesktop.org.<div><br><div>Thi=
s is my Github -:<a href=3D"https://github.com/ojuschugh1/">https://github.=
com/ojuschugh1/</a></div><div><div><br>Thank you in advance :D<br><br>Kind =
Regards,<br>Ojus Chugh<br></div></div></div></div>

--00000000000052260906123bc91a--
