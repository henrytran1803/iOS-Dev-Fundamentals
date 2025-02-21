### 🚀 **Phân loại toàn bộ UIControl trong UIKit để học hiệu quả**
UIKit cung cấp nhiều **UIControl** (các thành phần giao diện tương tác) giúp xây dựng giao diện trong iOS. Để học dễ dàng, mình chia chúng thành 6 nhóm chính:

---

## **1️⃣ Nhóm Input (Nhập dữ liệu)**
> Các control giúp người dùng nhập văn bản, số, chọn giá trị.

| UIControl | Mô tả |
|-----------|-------|
| **UITextField** | Ô nhập văn bản một dòng (nhập tên, email, số điện thoại). |
| **UITextView** | Ô nhập văn bản nhiều dòng (ghi chú, mô tả). |
| **UISearchBar** | Ô tìm kiếm (thường dùng trong danh sách, bảng). |
| **UIPickerView** | Bộ chọn giá trị theo danh sách cuộn (chọn giới tính, quốc gia,...) |
| **UIDatePicker** | Bộ chọn ngày, giờ. |
| **UISlider** | Thanh trượt để chọn giá trị số (ví dụ: điều chỉnh âm lượng). |
| **UIStepper** | Tăng hoặc giảm giá trị số (ví dụ: chọn số lượng sản phẩm). |
| **UIPageControl** | Chỉ báo trang (ví dụ: màn hình hướng dẫn có nhiều trang). |

### 🔥 **Nên học gì trước?**
1. `UITextField`, `UITextView` - Dùng nhập văn bản.
2. `UIPickerView`, `UIDatePicker` - Dùng chọn giá trị.
3. `UISlider`, `UIStepper` - Điều chỉnh giá trị.

---

## **2️⃣ Nhóm Button & Control Action (Nút & Điều khiển)**
> Các control giúp người dùng tương tác bằng cách nhấn hoặc kéo.

| UIControl | Mô tả |
|-----------|-------|
| **UIButton** | Nút bấm cơ bản, có thể chứa văn bản hoặc hình ảnh. |
| **UISwitch** | Nút bật/tắt trạng thái (ví dụ: bật/tắt thông báo). |
| **UIActivityIndicatorView** | Biểu tượng loading xoay tròn. |
| **UIProgressView** | Thanh hiển thị tiến trình (ví dụ: tải file). |
| **UISegmentedControl** | Nút chọn nhiều mục (ví dụ: chọn tab "Nam/Nữ", "Ngày/Tuần/Tháng"). |

### 🔥 **Nên học gì trước?**
1. `UIButton` - Cơ bản, dùng rất nhiều.
2. `UISwitch`, `UISegmentedControl` - Đơn giản nhưng hữu ích.
3. `UIProgressView`, `UIActivityIndicatorView` - Dùng khi tải dữ liệu.

---

## **3️⃣ Nhóm Navigation & Tab (Điều hướng)**
> Các control giúp quản lý nhiều màn hình.

| UIControl | Mô tả |
|-----------|-------|
| **UINavigationController** | Điều hướng giữa các màn hình (Back, Push, Pop). |
| **UITabBarController** | Quản lý nhiều màn hình bằng tab bar (Instagram, Facebook). |
| **UIToolbar** | Thanh công cụ có các nút (giống menu trên Google Docs). |

### 🔥 **Nên học gì trước?**
1. `UINavigationController` - Điều hướng giữa các màn hình.
2. `UITabBarController` - Dùng nhiều trong app có nhiều tính năng.
3. `UIToolbar` - Khi cần thanh công cụ bổ sung.

---

## **4️⃣ Nhóm Layout & Hiển thị dữ liệu**
> Các control giúp hiển thị danh sách hoặc quản lý bố cục.

| UIControl | Mô tả |
|-----------|-------|
| **UILabel** | Hiển thị văn bản. |
| **UIImageView** | Hiển thị hình ảnh. |
| **UITableView** | Hiển thị danh sách (giống danh bạ, Messenger). |
| **UICollectionView** | Hiển thị danh sách dạng lưới (giống ảnh trên Instagram). |
| **UIStackView** | Tự động sắp xếp view theo hàng hoặc cột. |
| **UIScrollView** | Cuộn nội dung (dùng khi màn hình dài hơn kích thước màn hình). |
| **WKWebView** | Hiển thị trang web trong app. |

### 🔥 **Nên học gì trước?**
1. `UILabel`, `UIImageView` - Cơ bản, cần biết.
2. `UITableView` - Dùng rất nhiều cho danh sách.
3. `UICollectionView` - Khi cần hiển thị dạng lưới.

---

## **5️⃣ Nhóm Alert & Popup**
> Các control hiển thị thông báo hoặc pop-up.

| UIControl | Mô tả |
|-----------|-------|
| **UIAlertController** | Hiển thị alert hoặc action sheet. |
| **UIActivityViewController** | Chia sẻ dữ liệu (Share Sheet). |
| **UIPopoverPresentationController** | Hiển thị pop-up trên iPad. |

### 🔥 **Nên học gì trước?**
1. `UIAlertController` - Dùng để hiển thị thông báo hoặc lựa chọn.
2. `UIActivityViewController` - Khi muốn chia sẻ nội dung.

---

## **6️⃣ Nhóm Hiệu Ứng & Animation**
> Các control giúp làm đẹp giao diện.

| UIControl | Mô tả |
|-----------|-------|
| **UIVisualEffectView** | Làm mờ nền (blur effect). |
| **UIView.animate()** | Thực hiện animation cho view. |
| **CoreAnimation (CAAnimation)** | Cung cấp animation nâng cao. |
| **Lottie** (thư viện ngoài) | Animation JSON đẹp mắt. |

### 🔥 **Nên học gì trước?**
1. `UIView.animate()` - Dễ học, giúp làm animation cơ bản.
2. `UIVisualEffectView` - Hiệu ứng làm mờ.
3. `Lottie` - Khi muốn animation đẹp hơn.

---

## 🎯 **Lộ Trình Học Hiệu Quả**
Bạn có thể học theo thứ tự này để làm quen với UIKit nhanh hơn:

### 🚀 **Giai đoạn 1: Cơ bản (3-5 ngày)**
✅ `UILabel`, `UIImageView`, `UIButton`, `UITextField`, `UISwitch`, `UIStackView`  
✅ `UINavigationController`, `UITabBarController`, `UIAlertController`  

### 🚀 **Giai đoạn 2: Tương tác & Layout (5-10 ngày)**
✅ `UITextView`, `UISearchBar`, `UIPickerView`, `UIDatePicker`, `UIScrollView`  
✅ `UITableView`, `UICollectionView`  

### 🚀 **Giai đoạn 3: Hiệu ứng & Hoàn thiện App**
✅ `UIView.animate()`, `UIVisualEffectView`  
✅ `Lottie`, `CoreAnimation`  

---

## ✅ **Tóm tắt: UIKit có bao nhiêu loại UIControl?**
| Nhóm | Control Quan Trọng |
|------|-----------------|
| 🎯 Input | `UITextField`, `UITextView`, `UISearchBar`, `UIPickerView` |
| 🎯 Button | `UIButton`, `UISwitch`, `UIProgressView`, `UISegmentedControl` |
| 🎯 Navigation | `UINavigationController`, `UITabBarController` |
| 🎯 Layout | `UILabel`, `UIImageView`, `UITableView`, `UICollectionView`, `UIStackView` |
| 🎯 Alert | `UIAlertController`, `UIActivityViewController` |
| 🎯 Animation | `UIView.animate()`, `Lottie` |

🔥 **Bạn muốn học nhóm nào trước?** 🚀
