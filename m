Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B69886090
	for <lists+nouveau@lfdr.de>; Thu, 21 Mar 2024 19:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF4210E0B9;
	Thu, 21 Mar 2024 18:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gCQOf9k7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9B710E0B9
 for <nouveau@lists.freedesktop.org>; Thu, 21 Mar 2024 18:32:52 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6e69ae0ff44so660748a34.1
 for <nouveau@lists.freedesktop.org>; Thu, 21 Mar 2024 11:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711045971; x=1711650771; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b10padQ2v8pKpPq+tT6VRz4ejQZi8GjjOf90d45LEkU=;
 b=gCQOf9k7p/BjOEBfIKlJ/S+MIMEQeRrV9MZlB6+6seNV1B3Ah/YgsHnRZG4N4L/C4N
 y7/5AohqpcuOrTkQr9xNUuZ1QVv0cGfzAYonyPkOE1WQTig5TqPdb8MlmO0u5R8m3AU5
 AXZYnEn2XZVvUOeOsLlSSRsx8ZRMQqIkC3lvrCl8uzcJxZwBDWbuVzl9uxCVdZJFT/TX
 /QhdFD7rJg2BBHVryRFG1lZtUAlNyUmW4nvf1wQiZLQbPEPvS0lMzXRhrwYV0BukXdBn
 plaben3qZbuEJkVjCVK9rIbr+Z+inRfBBgapoPwQyzFuMP/I4BGpwve2cQr4a6Mf9wDe
 xXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711045971; x=1711650771;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b10padQ2v8pKpPq+tT6VRz4ejQZi8GjjOf90d45LEkU=;
 b=ZTUERWTuXbkmWK8jHAoLa1o+aFl++CFCIc56gJXRpppo7aspLHVUm9E3PDfsSnJ4yw
 CISGdiR+fGJ+EQM+5M1IClDU4HBiAiumbetwcR2KP4r8BU9VoHHgyJo4yE86nsDy8RhS
 pAiu86ZtUOPfs968RG7/lExeV+smehvsDQvWHFCY3jampNZ01pjT89E9FQFi4bWBl9ga
 PDxUdxmRHnQr9BTiYW4fJjr6xIOvwvVF2v3aTbiARzxi1SHGknJBdlqdmMvGShS+qBrA
 DVimh2LYIUJr44MjITaVcZ/mcX+sEuCW0pm/rpY/voYhXihjOSHS85SSSpjX/ttNdH1p
 qM5g==
X-Gm-Message-State: AOJu0YwhyINuGT9IOt4nWZrMWPWVS6JmrYplelXHSrhSXUBEFmduG45T
 6lGx64CzyyvLld7OqdlUXcsToKKlYnl+d1F4jMyEIeMXpvBp4rCU8LzRhxUkwkiNGXNDxmyve4w
 3LR4x1Vb6obUZXRFWyViB3stkr6X2jd0lCvE=
X-Google-Smtp-Source: AGHT+IHpDwlZSXONG32sqw3HZM0PN2iR3PHm4XXUw5v15yq0rwhCCXJTQR4NYBQEMvmAo3/ECryusvsqcDkk1meNRMc=
X-Received: by 2002:a05:6870:f69f:b0:21f:b7d2:b8a1 with SMTP id
 el31-20020a056870f69f00b0021fb7d2b8a1mr36294oab.21.1711045970535; Thu, 21 Mar
 2024 11:32:50 -0700 (PDT)
MIME-Version: 1.0
From: Ojus Chugh <ojuschugh@gmail.com>
Date: Fri, 22 Mar 2024 00:02:39 +0530
Message-ID: <CAES57QUyupWEPGify23HXTPmU24DHUCNhyvXkHv9CUJraR78-Q@mail.gmail.com>
Subject: Regarding X.Org Endless Vacation of Code (EVoC)-Ojus Chugh
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000044ae5106142feff1"
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

--00000000000044ae5106142feff1
Content-Type: text/plain; charset="UTF-8"

Hello Everyone,

Greetings!

I hope you are doing well.

I am Ojus, a final-year IT student. Recently, I discovered EVoC as an
open-source enthusiast, and I'm deeply interested in participating in this
program. However, I am new to this and am looking for a mentor to guide me
through EVoC for a project related to nouveau. I would appreciate any ideas
or projects for this program, as I am open to learning new skills and
facing new challenges.

Here is my GitHub ID: https://github.com/ojuschugh1

Could you please guide me on the next steps? I am eager to work under my
mentor's guidance. I would appreciate it if anyone could become my mentor
and assist me in this endeavor.

Thank you in advance for your assistance :D

I eagerly await your response. I hope I can be of help to someone in any
way ;)

Thanks for your help and consideration.

Kind Regards,

Ojus Chugh

--00000000000044ae5106142feff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><span style=3D"font-size:1rem;font-style:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:1px;te=
xt-decoration:none;color:rgb(13,13,13);font-family:S=C3=B6hne,ui-sans-serif=
,system-ui,-apple-system,&quot;Segoe UI&quot;,Roboto,Ubuntu,Cantarell,&quot=
;Noto Sans&quot;,sans-serif,&quot;Helvetica Neue&quot;,Arial,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quo=
t;Noto Color Emoji&quot;">Hello Everyone,</span><p style=3D"font-size:1rem;=
font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:1px;text-decoration:none;border:0px solid rgb(227,227,227);=
box-sizing:border-box;margin:1.25em 0px;color:rgb(13,13,13);font-family:S=
=C3=B6hne,ui-sans-serif,system-ui,-apple-system,&quot;Segoe UI&quot;,Roboto=
,Ubuntu,Cantarell,&quot;Noto Sans&quot;,sans-serif,&quot;Helvetica Neue&quo=
t;,Arial,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Seg=
oe UI Symbol&quot;,&quot;Noto Color Emoji&quot;">Greetings!</p><p style=3D"=
font-size:1rem;font-style:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:1px;text-decoration:none;border:0px solid rg=
b(227,227,227);box-sizing:border-box;margin:1.25em 0px;color:rgb(13,13,13);=
font-family:S=C3=B6hne,ui-sans-serif,system-ui,-apple-system,&quot;Segoe UI=
&quot;,Roboto,Ubuntu,Cantarell,&quot;Noto Sans&quot;,sans-serif,&quot;Helve=
tica Neue&quot;,Arial,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&qu=
ot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;">I hope you ar=
e doing well.</p><p style=3D"font-size:1rem;font-style:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:1px;text-decora=
tion:none;border:0px solid rgb(227,227,227);box-sizing:border-box;margin:1.=
25em 0px;color:rgb(13,13,13);font-family:S=C3=B6hne,ui-sans-serif,system-ui=
,-apple-system,&quot;Segoe UI&quot;,Roboto,Ubuntu,Cantarell,&quot;Noto Sans=
&quot;,sans-serif,&quot;Helvetica Neue&quot;,Arial,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Col=
or Emoji&quot;" dir=3D"auto">I am Ojus, a final-year IT student. Recently, =
I discovered EVoC as an open-source enthusiast, and I&#39;m deeply interest=
ed in participating in this program. However, I am new to this and am looki=
ng for a mentor to guide me through EVoC for a project related to nouveau. =
I would appreciate any ideas or projects for this program, as I am open to =
learning new skills and facing new challenges.</p><p style=3D"font-size:1re=
m;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:1px;text-decoration:none;border:0px solid rgb(227,227,227=
);box-sizing:border-box;margin:1.25em 0px;color:rgb(13,13,13);font-family:S=
=C3=B6hne,ui-sans-serif,system-ui,-apple-system,&quot;Segoe UI&quot;,Roboto=
,Ubuntu,Cantarell,&quot;Noto Sans&quot;,sans-serif,&quot;Helvetica Neue&quo=
t;,Arial,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Seg=
oe UI Symbol&quot;,&quot;Noto Color Emoji&quot;">Here is my GitHub ID:=C2=
=A0<a href=3D"https://github.com/ojuschugh1" style=3D"color:rgb(66,133,244)=
;border:0px solid rgb(227,227,227);box-sizing:border-box;text-decoration:no=
ne;font-size:1rem" target=3D"_blank">https://github.com/ojuschugh1</a></p><=
p style=3D"font-size:1rem;font-style:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:1px;text-decoration:none;border:0=
px solid rgb(227,227,227);box-sizing:border-box;margin:1.25em 0px;color:rgb=
(13,13,13);font-family:S=C3=B6hne,ui-sans-serif,system-ui,-apple-system,&qu=
ot;Segoe UI&quot;,Roboto,Ubuntu,Cantarell,&quot;Noto Sans&quot;,sans-serif,=
&quot;Helvetica Neue&quot;,Arial,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;">Co=
uld you please guide me on the next steps? I am eager to work under my ment=
or&#39;s guidance. I would appreciate it if anyone could become my mentor a=
nd assist me in this endeavor.</p><p style=3D"font-size:1rem;font-style:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:1px;text-decoration:none;border:0px solid rgb(227,227,227);box-sizing:bor=
der-box;margin:1.25em 0px;color:rgb(13,13,13);font-family:S=C3=B6hne,ui-san=
s-serif,system-ui,-apple-system,&quot;Segoe UI&quot;,Roboto,Ubuntu,Cantarel=
l,&quot;Noto Sans&quot;,sans-serif,&quot;Helvetica Neue&quot;,Arial,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quo=
t;,&quot;Noto Color Emoji&quot;">Thank you in advance for your assistance :=
D</p><p style=3D"font-size:1rem;font-style:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:1px;text-decoration:none;bo=
rder:0px solid rgb(227,227,227);box-sizing:border-box;margin:1.25em 0px;col=
or:rgb(13,13,13);font-family:S=C3=B6hne,ui-sans-serif,system-ui,-apple-syst=
em,&quot;Segoe UI&quot;,Roboto,Ubuntu,Cantarell,&quot;Noto Sans&quot;,sans-=
serif,&quot;Helvetica Neue&quot;,Arial,&quot;Apple Color Emoji&quot;,&quot;=
Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quo=
t;">I eagerly await your response. I hope I can be of help to someone in an=
y way ;)</p><p style=3D"font-size:1rem;font-style:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:1px;text-decoration:=
none;border:0px solid rgb(227,227,227);box-sizing:border-box;margin:1.25em =
0px;color:rgb(13,13,13);font-family:S=C3=B6hne,ui-sans-serif,system-ui,-app=
le-system,&quot;Segoe UI&quot;,Roboto,Ubuntu,Cantarell,&quot;Noto Sans&quot=
;,sans-serif,&quot;Helvetica Neue&quot;,Arial,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Noto Color Em=
oji&quot;">Thanks for your help and consideration.</p><p style=3D"font-size=
:1rem;font-style:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:1px;text-decoration:none;border:0px solid rgb(227,227=
,227);box-sizing:border-box;margin:1.25em 0px;color:rgb(13,13,13);font-fami=
ly:S=C3=B6hne,ui-sans-serif,system-ui,-apple-system,&quot;Segoe UI&quot;,Ro=
boto,Ubuntu,Cantarell,&quot;Noto Sans&quot;,sans-serif,&quot;Helvetica Neue=
&quot;,Arial,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot=
;Segoe UI Symbol&quot;,&quot;Noto Color Emoji&quot;">Kind Regards,=C2=A0</p=
></div></div><div><div dir=3D"auto"><p style=3D"font-size:1rem;font-style:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:1px;text-decoration:none;border:0px solid rgb(227,227,227);box-sizing:b=
order-box;margin:1.25em 0px;color:rgb(13,13,13);font-family:S=C3=B6hne,ui-s=
ans-serif,system-ui,-apple-system,&quot;Segoe UI&quot;,Roboto,Ubuntu,Cantar=
ell,&quot;Noto Sans&quot;,sans-serif,&quot;Helvetica Neue&quot;,Arial,&quot=
;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&q=
uot;,&quot;Noto Color Emoji&quot;" dir=3D"auto">Ojus Chugh</p></div>
</div>

--00000000000044ae5106142feff1--
